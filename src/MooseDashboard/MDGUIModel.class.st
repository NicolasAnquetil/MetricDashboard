"
I'm the model of the MDPresenter
"
Class {
	#name : #MDGUIModel,
	#superclass : #Object,
	#instVars : [
		'mooseModel',
		'focusedEntities',
		'metrics',
		'query',
		'percentage'
	],
	#category : #'MooseDashboard-Core'
}

{ #category : #accessing }
MDGUIModel >> addMetric: aMetric [
	metrics add: aMetric
]

{ #category : #accessing }
MDGUIModel >> focusedEntities [
	^ focusedEntities
]

{ #category : #accessing }
MDGUIModel >> focusedEntities: anObject [
	focusedEntities := anObject
]

{ #category : #'as yet unclassified' }
MDGUIModel >> focusedEntitiesCore [
	^ (query coreClasses: focusedEntities) ifEmpty: [ #() ]
]

{ #category : #initialize }
MDGUIModel >> initialize [
	super initialize.
	metrics := OrderedCollection new.
	query := MDQuery new.
]

{ #category : #utilities }
MDGUIModel >> loadProjectFromMSEFile [
	MooseModel root allModels
		ifEmpty: [	MVSMSELoader importModel].
	MooseModel root ifNotEmpty: [ mooseModel := MooseModel root allModels last ]
]

{ #category : #accessing }
MDGUIModel >> metrics [
	^ metrics
]

{ #category : #accessing }
MDGUIModel >> metrics: anObject [
	metrics := anObject
]

{ #category : #accessing }
MDGUIModel >> mooseModelSummary [
	^ {mooseModel allModelPackages.
	mooseModel allModelNamespaces.
	mooseModel allModelClasses.
	mooseModel allModelMethods}
]

{ #category : #'as yet unclassified' }
MDGUIModel >> percentBigClasses [
	^ query percentageOfBigClasses: percentage in: focusedEntities
]

{ #category : #'as yet unclassified' }
MDGUIModel >> percentOfComplexeClasses [
	^ query percentageOfComplexeClasses: percentage in: focusedEntities
]

{ #category : #accessor }
MDGUIModel >> percentage [
	^ percentage
]

{ #category : #accessor }
MDGUIModel >> percentage: anObject [
	percentage := anObject
]

{ #category : #utilities }
MDGUIModel >> percentageOfBigClasses [
	^ query percentageOfBigClasses: percentage  in: focusedEntities
]

{ #category : #accessing }
MDGUIModel >> projectModel [
	^ mooseModel
]

{ #category : #accessing }
MDGUIModel >> projectModel: anObject [
	mooseModel := anObject
]

{ #category : #conversion }
MDGUIModel >> truncateFloat: aFloat to: aValue [
	^ (aFloat truncateTo: aValue) asString
]
