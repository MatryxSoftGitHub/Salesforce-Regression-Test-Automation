import {LightningElement, api} from 'lwc';

export default class PriPub extends LightningElement {
message = 'This is a private Property';
@api recordId;
}