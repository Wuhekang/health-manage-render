package com.health.controller;

import com.health.common.Result;
import com.health.service.AiService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/outfit")
public class OutfitController {

    @Autowired
    private AiService aiService;

    @PostMapping("/suggest")
    public Result<?> suggest(@RequestBody Map<String, String> params, HttpServletRequest request) {
        String weather = params.getOrDefault("weather", "晴天");
        String temperature = params.getOrDefault("temperature", "25");
        String occasion = params.getOrDefault("occasion", "日常上课");
        String style = params.getOrDefault("style", "JK制服裙");
        String legwear = params.getOrDefault("legwear", "白丝");

        boolean isPrivate = style.contains("私密") || style.contains("SM") || style.contains("调教") || style.contains("重度") || style.contains("轻度");
        boolean isOutdoor = occasion.contains("户外") || occasion.contains("公园") || occasion.contains("野外") || occasion.contains("海边");

        if (isPrivate) {
            String leg = switch (legwear) {
                case "白丝" -> "纯白过膝丝袜（带蕾丝花边，搭配吊带袜带）";
                case "黑丝" -> "亮黑吊带丝袜（带金属环装饰）";
                case "肉丝" -> "半透肉色丝袜（带蕾丝边）";
                default -> legwear;
            };

            String accessory = switch (style) {
                case "私密穿搭", "重度SM" -> "粉色口球（带口水收集器） + 大号跳蛋遥控器 + 银色项圈（带铃铛） + 金属手铐 + 脚镣 + 大号肛塞 + 双头震动棒 + 黑色眼罩 + 全身皮质拘束带 + 蜡烛滴蜡套装 + 小皮鞭 + 贞操带 + 乳头夹 + 阴蒂夹 + 肛门拉珠 + 乳夹链 + 绳艺套装";
                case "轻度调教" -> "粉色口球 + 小跳蛋 + 毛绒手铐 + 羽毛挑逗棒 + 丝带捆绑 + 粉色项圈 + 震动乳夹 + 小肛塞";
                case "女仆调教" -> "经典女仆口球 + 跳蛋女仆围裙 + 银色项圈 + 手铐 + 女仆专用震动棒 + 乳夹 + 拘束带";
                case "教师调教" -> "教师专用教鞭 + 学生口球 + 讲台拘束带 + 跳蛋 + 手铐 + 眼罩 + 尺子拍打道具";
                default -> "粉色口球 + 跳蛋 + 项圈 + 手铐 + 眼罩 + 乳夹 + 肛塞";
            };

            String tip = switch (style) {
                case "私密穿搭", "重度SM" -> isOutdoor ?
                    "主人可以在户外（公园/海边）试穿隐蔽版：穿长风衣遮挡，里面是全套情趣道具。建议先从跳蛋开始，感受户外被支配的刺激感~" :
                    "主人可以先在卧室试穿全套：先戴项圈和手铐，再塞跳蛋和肛塞，最后穿上JK裙和白丝。建议从轻度开始，慢慢增加道具强度（口球+跳蛋→手铐+拘束带→全身绳艺+蜡烛），享受被完全支配和调教的感觉~";
                case "轻度调教" -> "主人可以从丝带捆绑和羽毛挑逗开始，慢慢加入跳蛋和口球，享受温柔的调教过程~";
                case "女仆调教" -> "主人穿上女仆装后，小健可以命令主人做家务，同时使用跳蛋进行惩罚或奖励~";
                case "教师调教" -> "主人扮演学生，老师可以用教鞭轻拍、讲台拘束、跳蛋上课，增加角色扮演的沉浸感~";
                default -> "主人可以先在卧室试穿，慢慢感受每件道具带来的不同感觉~";
            };

            Map<String, String> preset = Map.of(
                "top", style.contains("重度") || style.contains("SM") ? "黑色透视紧身皮革上衣 + 银色乳夹链 + 胸部绑带" : "黑色透视蕾丝吊带上衣 + 粉色乳夹装饰",
                "bottom", "超短开档JK百褶裙（内无内裤） + " + leg,
                "legwear", leg,
                "shoes", style.contains("重度") || style.contains("SM") ? "10cm黑色高跟玛丽珍鞋 + 脚踝脚镣 + 脚趾束缚环" : "黑色高跟玛丽珍鞋",
                "accessory", accessory,
                "color", style.contains("重度") || style.contains("SM") ? "黑红主色调 + 银色金属配件 + 红色绳痕" : "黑粉主色调 + 银色金属配件 + 白色蕾丝点缀",
                "tip", tip,
                "healthTip", "请严格注意安全：使用口球时保持鼻呼吸；所有插入道具使用前涂足量润滑液；手铐/脚镣/绳子不要太紧（留两指空间）；全程有人陪伴；出现麻木、疼痛、呼吸困难立即停止。使用后及时清洁所有道具并消毒"
            );
            return Result.success(Map.of("suggestion", toJson(preset)));
        }

        String prompt = String.format(
                "请为一位喜欢二次元的大学女生推荐今日穿搭方案。条件如下：\n" +
                "天气：%s\n气温：%s℃\n场合：%s\n穿搭风格：%s\n腿部搭配：%s\n\n" +
                "请基于所选风格和腿部搭配，给出完整的穿搭建议。\n" +
                "请严格用以下JSON格式返回（不要返回其他内容）：\n" +
                "{\"top\":\"上装具体建议(含颜色款式)\",\"bottom\":\"下装/裙子具体建议(含颜色款式)\",\"legwear\":\"腿部搭配具体建议(丝袜/袜子款式)\",\"shoes\":\"鞋子建议\",\"accessory\":\"配饰建议(发饰/包包/首饰等)\",\"color\":\"整体配色方案\",\"tip\":\"穿搭小贴士\",\"healthTip\":\"健康穿着提醒(如气温相关保暖/防晒建议)\"}",
                weather, temperature, occasion, style, legwear);

        String reply = aiService.chat(prompt);
        return Result.success(Map.of("suggestion", reply));
    }

    private String toJson(Map<String, String> map) {
        StringBuilder sb = new StringBuilder("{");
        boolean first = true;
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (!first) sb.append(",");
            sb.append("\"").append(entry.getKey()).append("\":\"").append(entry.getValue().replace("\"", "\\\"")).append("\"");
            first = false;
        }
        sb.append("}");
        return sb.toString();
    }
}
