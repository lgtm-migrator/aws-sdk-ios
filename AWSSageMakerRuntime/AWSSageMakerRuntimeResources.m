//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSSageMakerRuntimeResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSSageMakerRuntimeResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSSageMakerRuntimeResources

+ (instancetype)sharedInstance {
    static AWSSageMakerRuntimeResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSSageMakerRuntimeResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-05-13\",\
    \"endpointPrefix\":\"runtime.sagemaker\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"Amazon SageMaker Runtime\",\
    \"serviceId\":\"SageMaker Runtime\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"sagemaker\",\
    \"uid\":\"runtime.sagemaker-2017-05-13\"\
  },\
  \"operations\":{\
    \"InvokeEndpoint\":{\
      \"name\":\"InvokeEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/endpoints/{EndpointName}/invocations\"\
      },\
      \"input\":{\"shape\":\"InvokeEndpointInput\"},\
      \"output\":{\"shape\":\"InvokeEndpointOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailure\"},\
        {\"shape\":\"ServiceUnavailable\"},\
        {\"shape\":\"ValidationError\"},\
        {\"shape\":\"ModelError\"},\
        {\"shape\":\"InternalDependencyException\"},\
        {\"shape\":\"ModelNotReadyException\"}\
      ],\
      \"documentation\":\"<p>After you deploy a model into production using Amazon SageMaker hosting services, your client applications use this API to get inferences from the model hosted at the specified endpoint. </p> <p>For an overview of Amazon SageMaker, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html\\\">How It Works</a>. </p> <p>Amazon SageMaker strips all POST headers except those supported by the API. Amazon SageMaker might add additional headers. You should not rely on the behavior of headers outside those enumerated in the request syntax. </p> <p>Calls to <code>InvokeEndpoint</code> are authenticated by using Amazon Web Services Signature Version 4. For information, see <a href=\\\"https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html\\\">Authenticating Requests (Amazon Web Services Signature Version 4)</a> in the <i>Amazon S3 API Reference</i>.</p> <p>A customer's model containers must respond to requests within 60 seconds. The model itself can have a maximum processing time of 60 seconds before responding to invocations. If your model is going to take 50-60 seconds of processing time, the SDK socket timeout should be set to be 70 seconds.</p> <note> <p>Endpoints are scoped to an individual account, and are not public. The URL does not contain the account ID, but Amazon SageMaker determines the account ID from the authentication token that is supplied by the caller.</p> </note>\"\
    },\
    \"InvokeEndpointAsync\":{\
      \"name\":\"InvokeEndpointAsync\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/endpoints/{EndpointName}/async-invocations\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"InvokeEndpointAsyncInput\"},\
      \"output\":{\"shape\":\"InvokeEndpointAsyncOutput\"},\
      \"errors\":[\
        {\"shape\":\"InternalFailure\"},\
        {\"shape\":\"ServiceUnavailable\"},\
        {\"shape\":\"ValidationError\"}\
      ],\
      \"documentation\":\"<p>After you deploy a model into production using Amazon SageMaker hosting services, your client applications use this API to get inferences from the model hosted at the specified endpoint in an asynchronous manner.</p> <p>Inference requests sent to this API are enqueued for asynchronous processing. The processing of the inference request may or may not complete before the you receive a response from this API. The response from this API will not contain the result of the inference request but contain information about where you can locate it.</p> <p>Amazon SageMaker strips all <code>POST</code> headers except those supported by the API. Amazon SageMaker might add additional headers. You should not rely on the behavior of headers outside those enumerated in the request syntax.</p> <p>Calls to <code>InvokeEndpointAsync</code> are authenticated by using Amazon Web Services Signature Version 4. For information, see <a href=\\\"https://docs.aws.amazon.com/https:/docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html\\\">Authenticating Requests (Amazon Web Services Signature Version 4)</a> in the <i>Amazon S3 API Reference</i>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"BodyBlob\":{\
      \"type\":\"blob\",\
      \"max\":6291456,\
      \"sensitive\":true\
    },\
    \"CustomAttributesHeader\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"\\\\p{ASCII}*\",\
      \"sensitive\":true\
    },\
    \"EnableExplanationsHeader\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\".*\"\
    },\
    \"EndpointName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"Header\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"\\\\p{ASCII}*\"\
    },\
    \"InferenceId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"\\\\A\\\\S[\\\\p{Print}]*\\\\z\"\
    },\
    \"InputLocationHeader\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"^(https|s3)://([^/]+)/?(.*)$\"\
    },\
    \"InternalDependencyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>Your request caused an exception with an internal dependency. Contact customer support. </p>\",\
      \"error\":{\"httpStatusCode\":530},\
      \"exception\":true,\
      \"fault\":true,\
      \"synthetic\":true\
    },\
    \"InternalFailure\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p> An internal failure occurred. </p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true,\
      \"synthetic\":true\
    },\
    \"InvokeEndpointAsyncInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"InputLocation\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of the endpoint that you specified when you created the endpoint using the <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/APIReference/API_CreateEndpoint.html\\\"> <code>CreateEndpoint</code> </a> API.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EndpointName\"\
        },\
        \"ContentType\":{\
          \"shape\":\"Header\",\
          \"documentation\":\"<p>The MIME type of the input data in the request body.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Content-Type\"\
        },\
        \"Accept\":{\
          \"shape\":\"Header\",\
          \"documentation\":\"<p>The desired MIME type of the inference in the response.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Accept\"\
        },\
        \"CustomAttributes\":{\
          \"shape\":\"CustomAttributesHeader\",\
          \"documentation\":\"<p>Provides additional information about a request for an inference submitted to a model hosted at an Amazon SageMaker endpoint. The information is an opaque value that is forwarded verbatim. You could use this value, for example, to provide an ID that you can use to track a request or to provide other metadata that a service endpoint was programmed to process. The value must consist of no more than 1024 visible US-ASCII characters as specified in <a href=\\\"https://datatracker.ietf.org/doc/html/rfc7230#section-3.2.6\\\">Section 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). </p> <p>The code in your model is responsible for setting or updating any custom attributes in the response. If your code does not set this value in the response, an empty value is returned. For example, if a custom attribute represents the trace ID, your model can prepend the custom attribute with <code>Trace ID</code>: in your post-processing function. </p> <p>This feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker Python SDK. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Custom-Attributes\"\
        },\
        \"InferenceId\":{\
          \"shape\":\"InferenceId\",\
          \"documentation\":\"<p>The identifier for the inference request. Amazon SageMaker will generate an identifier for you if none is specified. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Inference-Id\"\
        },\
        \"InputLocation\":{\
          \"shape\":\"InputLocationHeader\",\
          \"documentation\":\"<p>The Amazon S3 URI where the inference request payload is stored.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-InputLocation\"\
        },\
        \"RequestTTLSeconds\":{\
          \"shape\":\"RequestTTLSecondsHeader\",\
          \"documentation\":\"<p>Maximum age in seconds a request can be in the queue before it is marked as expired.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-RequestTTLSeconds\"\
        }\
      }\
    },\
    \"InvokeEndpointAsyncOutput\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"InferenceId\":{\
          \"shape\":\"Header\",\
          \"documentation\":\"<p>Identifier for an inference request. This will be the same as the <code>InferenceId</code> specified in the input. Amazon SageMaker will generate an identifier for you if you do not specify one.</p>\"\
        },\
        \"OutputLocation\":{\
          \"shape\":\"Header\",\
          \"documentation\":\"<p>The Amazon S3 URI where the inference response payload is stored.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-OutputLocation\"\
        }\
      }\
    },\
    \"InvokeEndpointInput\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"Body\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"EndpointName\",\
          \"documentation\":\"<p>The name of the endpoint that you specified when you created the endpoint using the <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/API_CreateEndpoint.html\\\">CreateEndpoint</a> API. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"EndpointName\"\
        },\
        \"Body\":{\
          \"shape\":\"BodyBlob\",\
          \"documentation\":\"<p>Provides input data, in the format specified in the <code>ContentType</code> request header. Amazon SageMaker passes all of the data in the body to the model. </p> <p>For information about the format of the request body, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html\\\">Common Data Formats-Inference</a>.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"Header\",\
          \"documentation\":\"<p>The MIME type of the input data in the request body.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"Accept\":{\
          \"shape\":\"Header\",\
          \"documentation\":\"<p>The desired MIME type of the inference in the response.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Accept\"\
        },\
        \"CustomAttributes\":{\
          \"shape\":\"CustomAttributesHeader\",\
          \"documentation\":\"<p>Provides additional information about a request for an inference submitted to a model hosted at an Amazon SageMaker endpoint. The information is an opaque value that is forwarded verbatim. You could use this value, for example, to provide an ID that you can use to track a request or to provide other metadata that a service endpoint was programmed to process. The value must consist of no more than 1024 visible US-ASCII characters as specified in <a href=\\\"https://tools.ietf.org/html/rfc7230#section-3.2.6\\\">Section 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). </p> <p>The code in your model is responsible for setting or updating any custom attributes in the response. If your code does not set this value in the response, an empty value is returned. For example, if a custom attribute represents the trace ID, your model can prepend the custom attribute with <code>Trace ID:</code> in your post-processing function.</p> <p>This feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker Python SDK.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Custom-Attributes\"\
        },\
        \"TargetModel\":{\
          \"shape\":\"TargetModelHeader\",\
          \"documentation\":\"<p>The model to request for inference when invoking a multi-model endpoint.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Target-Model\"\
        },\
        \"TargetVariant\":{\
          \"shape\":\"TargetVariantHeader\",\
          \"documentation\":\"<p>Specify the production variant to send the inference request to when invoking an endpoint that is running two or more variants. Note that this parameter overrides the default behavior for the endpoint, which is to distribute the invocation traffic based on the variant weights.</p> <p>For information about how to use variant targeting to perform a/b testing, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/model-ab-testing.html\\\">Test models in production</a> </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Target-Variant\"\
        },\
        \"TargetContainerHostname\":{\
          \"shape\":\"TargetContainerHostnameHeader\",\
          \"documentation\":\"<p>If the endpoint hosts multiple containers and is configured to use direct invocation, this parameter specifies the host name of the container to invoke.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Target-Container-Hostname\"\
        },\
        \"InferenceId\":{\
          \"shape\":\"InferenceId\",\
          \"documentation\":\"<p>If you provide a value, it is added to the captured data when you enable data capture on the endpoint. For information about data capture, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/model-monitor-data-capture.html\\\">Capture Data</a>.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Inference-Id\"\
        },\
        \"EnableExplanations\":{\
          \"shape\":\"EnableExplanationsHeader\",\
          \"documentation\":\"<p>An optional JMESPath expression used to override the <code>EnableExplanations</code> parameter of the <code>ClarifyExplainerConfig</code> API. See the <a href=\\\"https://docs.aws.amazon.com/clarify-online-explainability-create-endpoint.html#clarify-online-exaplainability-create-endpoint-enable\\\">EnableExplanations</a> section in the developer guide for more information. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Enable-Explanations\"\
        }\
      },\
      \"payload\":\"Body\"\
    },\
    \"InvokeEndpointOutput\":{\
      \"type\":\"structure\",\
      \"required\":[\"Body\"],\
      \"members\":{\
        \"Body\":{\
          \"shape\":\"BodyBlob\",\
          \"documentation\":\"<p>Includes the inference provided by the model. </p> <p>For information about the format of the response body, see <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/cdf-inference.html\\\">Common Data Formats-Inference</a>.</p> <p>If the explainer is activated, the body includes the explanations provided by the model. For more information, see the <b>Response section</b> under <a href=\\\"https://docs.aws.amazon.com/sagemaker/latest/dg/clarify-online-explainability-invoke-endpoint.html#clarify-online-explainability-response\\\">Invoke the Endpoint</a> in the Developer Guide.</p>\"\
        },\
        \"ContentType\":{\
          \"shape\":\"Header\",\
          \"documentation\":\"<p>The MIME type of the inference returned in the response body.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Content-Type\"\
        },\
        \"InvokedProductionVariant\":{\
          \"shape\":\"Header\",\
          \"documentation\":\"<p>Identifies the production variant that was invoked.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"x-Amzn-Invoked-Production-Variant\"\
        },\
        \"CustomAttributes\":{\
          \"shape\":\"CustomAttributesHeader\",\
          \"documentation\":\"<p>Provides additional information in the response about the inference returned by a model hosted at an Amazon SageMaker endpoint. The information is an opaque value that is forwarded verbatim. You could use this value, for example, to return an ID received in the <code>CustomAttributes</code> header of a request or other metadata that a service endpoint was programmed to produce. The value must consist of no more than 1024 visible US-ASCII characters as specified in <a href=\\\"https://tools.ietf.org/html/rfc7230#section-3.2.6\\\">Section 3.3.6. Field Value Components</a> of the Hypertext Transfer Protocol (HTTP/1.1). If the customer wants the custom attribute returned, the model must set the custom attribute to be included on the way back. </p> <p>The code in your model is responsible for setting or updating any custom attributes in the response. If your code does not set this value in the response, an empty value is returned. For example, if a custom attribute represents the trace ID, your model can prepend the custom attribute with <code>Trace ID:</code> in your post-processing function.</p> <p>This feature is currently supported in the Amazon Web Services SDKs but not in the Amazon SageMaker Python SDK.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amzn-SageMaker-Custom-Attributes\"\
        }\
      },\
      \"payload\":\"Body\"\
    },\
    \"LogStreamArn\":{\"type\":\"string\"},\
    \"Message\":{\
      \"type\":\"string\",\
      \"max\":2048\
    },\
    \"ModelError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"},\
        \"OriginalStatusCode\":{\
          \"shape\":\"StatusCode\",\
          \"documentation\":\"<p> Original status code. </p>\"\
        },\
        \"OriginalMessage\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p> Original message. </p>\"\
        },\
        \"LogStreamArn\":{\
          \"shape\":\"LogStreamArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the log stream. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Model (owned by the customer in the container) returned 4xx or 5xx error code. </p>\",\
      \"error\":{\"httpStatusCode\":424},\
      \"exception\":true\
    },\
    \"ModelNotReadyException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>Either a serverless endpoint variant's resources are still being provisioned, or a multi-model endpoint is still downloading or loading the target model. Wait and try your request again.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true,\
      \"synthetic\":true\
    },\
    \"RequestTTLSecondsHeader\":{\
      \"type\":\"integer\",\
      \"max\":21600,\
      \"min\":60\
    },\
    \"ServiceUnavailable\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p> The service is unavailable. Try your call again. </p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true,\
      \"fault\":true,\
      \"synthetic\":true\
    },\
    \"StatusCode\":{\"type\":\"integer\"},\
    \"TargetContainerHostnameHeader\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"TargetModelHeader\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"\\\\A\\\\S[\\\\p{Print}]*\\\\z\"\
    },\
    \"TargetVariantHeader\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ValidationError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p> Inspect your request and try again. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true,\
      \"synthetic\":true\
    }\
  },\
  \"documentation\":\"<p> The Amazon SageMaker runtime API. </p>\"\
}\
";
}

@end
