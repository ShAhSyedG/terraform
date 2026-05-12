import { App } from 'aws-cdk-lib';
import { DemoStack } from '../lib/demo-stack';

const app = new App();

new DemoStack(app, 'DemoStack', {
  description: 'CDK Demo Stack — S3 bucket with versioning and DESTROY removal policy',
});
