package com.operatingSystem.Utils;

public class aliHelp {
//    @Autowired
//    ImageAsyncScanResultsRequest imageAsyncScanResultsRequest;
//    public NetResult goSyn(String address)
//    {
//        NetResult r = new NetResult();
//        IClientProfile profile = DefaultProfile.getProfile("cn-shanghai", "LTAIRLEPC2semIlA","YDwhNUarZzzP39ly0KN5Iz8SiXEz5P");
//        DefaultProfile.addEndpoint(Base.getEndPointName(), "cn-shanghai", "Green", "green.cn-shanghai.aliyuncs.com");
//        IAcsClient client = new DefaultAcsClient(profile);
//
//        ImageSyncScanRequest imageSyncScanRequest = new ImageSyncScanRequest();
//        imageSyncScanRequest.setAcceptFormat(FormatType.JSON); // 指定api返回格式
//        imageSyncScanRequest.setHttpContentType(FormatType.JSON);
//        imageSyncScanRequest.setMethod(com.aliyuncs.http.MethodType.POST); // 指定请求方法
//        imageSyncScanRequest.setEncoding("utf-8");
//        imageSyncScanRequest.setRegionId(regionId);
//
//
//        List<Map<String, Object>> tasks = new ArrayList<Map<String, Object>>();
//        Map<String, Object> task = new LinkedHashMap<String, Object>();
//        task.put("dataId", UUID.randomUUID().toString());
//        task.put("url", "http://www.rzflyblog.link"+address);
//        task.put("time", new Date());
//
//        tasks.add(task);
//        JSONObject data = new JSONObject();
//        /**
//         * porn: 色情
//         * terrorism: 暴恐
//         * qrcode: 二维码
//         * ad: 图片广告
//         * ocr: 文字识别
//         */
//        data.put("scenes", Arrays.asList("porn", "ocr", "qrcode", "sface"));
//        data.put("tasks", tasks);
//
//        imageSyncScanRequest.setHttpContent(data.toJSONString().getBytes("UTF-8"), "UTF-8", FormatType.JSON);
//
//        /**
//         * 请务必设置超时时间
//         */
//        imageSyncScanRequest.setConnectTimeout(3000);
//        imageSyncScanRequest.setReadTimeout(6000);
//
//        try {
//            HttpResponse httpResponse = client.doAction(imageSyncScanRequest);
//
//            if (httpResponse.isSuccess()) {
//                JSONObject scrResponse = JSON.parseObject(new String(httpResponse.getHttpContent(), "UTF-8"));
//                System.out.println(JSON.toJSONString(scrResponse, true));
//                if (200 == scrResponse.getInteger("code")) {
//                    JSONArray taskResults = scrResponse.getJSONArray("data");
//                    for (Object taskResult : taskResults) {
//                        if(200 == ((JSONObject)taskResult).getInteger("code")){
//                            JSONArray sceneResults = ((JSONObject)taskResult).getJSONArray("results");
//                            for (Object sceneResult : sceneResults) {
//                                String scene = ((JSONObject)sceneResult).getString("scene");
//                                String suggestion = ((JSONObject)sceneResult).getString("suggestion");
//                                //根据scene和suggetion做相关的处理
//                                //do something
//                                System.out.println("args = [" + scene + "]");
//                                System.out.println("args = [" + suggestion + "]");
//                            }
//                        }else{
//                            System.out.println("task process fail:" + ((JSONObject)taskResult).getInteger("code"));
//                        }
//                    }
//                } else {
//                    System.out.println("detect not success. code:" + scrResponse.getInteger("code"));
//                }
//                result.status=0;
//                result.result=scrResponse;
//                return result;
//            } else {
//                System.out.println("response not success. status:" + httpResponse.getStatus());
//                result.status=0;
//                result.result=httpResponse.getStatus();
//                return result;
//            }
//        } catch (ServerException e) {
//            e.printStackTrace();
//            result.status=-1;
//            result.result="出错了！";
//            return result;
//        } catch (ClientException e) {
//            e.printStackTrace();
//            result.status=-1;
//            result.result="出错了！";
//            return result;
//        } catch (Exception e){
//            e.printStackTrace();
//            result.status=-1;
//            result.result="出错了！";
//            return result;
//        }
//    }
}
