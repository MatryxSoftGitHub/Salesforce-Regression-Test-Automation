trigger AccountAfterTrigger on Account (after insert) {
System.debug('After Insert'+Trigger.new);
}