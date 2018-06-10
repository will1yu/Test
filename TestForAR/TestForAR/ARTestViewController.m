//
//  ARTestViewController.m
//  TestForAR
//
//  Created by Will Yu on 2018/6/10.
//  Copyright © 2018年 Will Yu. All rights reserved.
//

#import "ARTestViewController.h"

@interface ARTestViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) ARSCNView *sceneView;

@end

@implementation ARTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.sceneView.delegate = self;
    self.sceneView.showsStatistics = YES;
    [self.view addSubview:self.sceneView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
- (void)setupScene {
    SCNScene *scene = [[SCNScene alloc] init];
    
    SCNBox *boxGeometry = [SCNBox boxWithWidth:0.1 height:0.1 length:0.1 chamferRadius:0.0];
    SCNNode *boxNode = [SCNNode nodeWithGeometry:boxGeometry];
    boxNode.position = SCNVector3Make(0, 0, -0.5);
    [scene.rootNode addChildNode:boxNode];
    
    self.sceneView.scene = scene;
}

#pragma mark - ARSCNViewDelegate
/*
- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    
}
*/
 
- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    
}

- (void)sessionWasInterrupted:(ARSession *)session {
    
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    
}

#pragma mark - UI
- (ARSCNView *)sceneView {
    if (!_sceneView) {
        _sceneView = [[ARSCNView alloc] initWithFrame:self.view.bounds];
        _sceneView.autoenablesDefaultLighting = YES;
    }
    return _sceneView;
}

@end
