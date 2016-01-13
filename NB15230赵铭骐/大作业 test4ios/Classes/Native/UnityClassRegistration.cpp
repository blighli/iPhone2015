struct ClassRegistrationContext;
void InvokeRegisterStaticallyLinkedModuleClasses(ClassRegistrationContext& context)
{
	// Do nothing (we're in stripping mode)
}

void RegisterStaticallyLinkedModulesGranular()
{
	void RegisterModule_AI();
	RegisterModule_AI();

	void RegisterModule_Animation();
	RegisterModule_Animation();

	void RegisterModule_Audio();
	RegisterModule_Audio();

	void RegisterModule_ParticleSystem();
	RegisterModule_ParticleSystem();

	void RegisterModule_ParticlesLegacy();
	RegisterModule_ParticlesLegacy();

	void RegisterModule_Physics();
	RegisterModule_Physics();

	void RegisterModule_Physics2D();
	RegisterModule_Physics2D();

	void RegisterModule_TextRendering();
	RegisterModule_TextRendering();

	void RegisterModule_UI();
	RegisterModule_UI();

}

void RegisterAllClasses()
{
	//Total: 86 classes
	//0. AssetBundle
	void RegisterClass_AssetBundle();
	RegisterClass_AssetBundle();

	//1. NamedObject
	void RegisterClass_NamedObject();
	RegisterClass_NamedObject();

	//2. EditorExtension
	void RegisterClass_EditorExtension();
	RegisterClass_EditorExtension();

	//3. QualitySettings
	void RegisterClass_QualitySettings();
	RegisterClass_QualitySettings();

	//4. GlobalGameManager
	void RegisterClass_GlobalGameManager();
	RegisterClass_GlobalGameManager();

	//5. GameManager
	void RegisterClass_GameManager();
	RegisterClass_GameManager();

	//6. Mesh
	void RegisterClass_Mesh();
	RegisterClass_Mesh();

	//7. Renderer
	void RegisterClass_Renderer();
	RegisterClass_Renderer();

	//8. Component
	void RegisterClass_Component();
	RegisterClass_Component();

	//9. GUILayer
	void RegisterClass_GUILayer();
	RegisterClass_GUILayer();

	//10. Behaviour
	void RegisterClass_Behaviour();
	RegisterClass_Behaviour();

	//11. Texture
	void RegisterClass_Texture();
	RegisterClass_Texture();

	//12. Texture2D
	void RegisterClass_Texture2D();
	RegisterClass_Texture2D();

	//13. RenderTexture
	void RegisterClass_RenderTexture();
	RegisterClass_RenderTexture();

	//14. RectTransform
	void RegisterClass_RectTransform();
	RegisterClass_RectTransform();

	//15. Transform
	void RegisterClass_Transform();
	RegisterClass_Transform();

	//16. Shader
	void RegisterClass_Shader();
	RegisterClass_Shader();

	//17. TextAsset
	void RegisterClass_TextAsset();
	RegisterClass_TextAsset();

	//18. Material
	void RegisterClass_Material();
	RegisterClass_Material();

	//19. Sprite
	void RegisterClass_Sprite();
	RegisterClass_Sprite();

	//20. Camera
	void RegisterClass_Camera();
	RegisterClass_Camera();

	//21. MonoBehaviour
	void RegisterClass_MonoBehaviour();
	RegisterClass_MonoBehaviour();

	//22. Light
	void RegisterClass_Light();
	RegisterClass_Light();

	//23. GameObject
	void RegisterClass_GameObject();
	RegisterClass_GameObject();

	//24. ParticleSystem
	void RegisterClass_ParticleSystem();
	RegisterClass_ParticleSystem();

	//25. Rigidbody
	void RegisterClass_Rigidbody();
	RegisterClass_Rigidbody();

	//26. Joint
	void RegisterClass_Joint();
	RegisterClass_Joint();

	//27. SpringJoint
	void RegisterClass_SpringJoint();
	RegisterClass_SpringJoint();

	//28. Collider
	void RegisterClass_Collider();
	RegisterClass_Collider();

	//29. CapsuleCollider
	void RegisterClass_CapsuleCollider();
	RegisterClass_CapsuleCollider();

	//30. CharacterController
	void RegisterClass_CharacterController();
	RegisterClass_CharacterController();

	//31. Rigidbody2D
	void RegisterClass_Rigidbody2D();
	RegisterClass_Rigidbody2D();

	//32. Collider2D
	void RegisterClass_Collider2D();
	RegisterClass_Collider2D();

	//33. NavMeshAgent
	void RegisterClass_NavMeshAgent();
	RegisterClass_NavMeshAgent();

	//34. AudioClip
	void RegisterClass_AudioClip();
	RegisterClass_AudioClip();

	//35. SampleClip
	void RegisterClass_SampleClip();
	RegisterClass_SampleClip();

	//36. AudioSource
	void RegisterClass_AudioSource();
	RegisterClass_AudioSource();

	//37. AudioBehaviour
	void RegisterClass_AudioBehaviour();
	RegisterClass_AudioBehaviour();

	//38. Animation
	void RegisterClass_Animation();
	RegisterClass_Animation();

	//39. Animator
	void RegisterClass_Animator();
	RegisterClass_Animator();

	//40. DirectorPlayer
	void RegisterClass_DirectorPlayer();
	RegisterClass_DirectorPlayer();

	//41. GUIText
	void RegisterClass_GUIText();
	RegisterClass_GUIText();

	//42. GUIElement
	void RegisterClass_GUIElement();
	RegisterClass_GUIElement();

	//43. Font
	void RegisterClass_Font();
	RegisterClass_Font();

	//44. Canvas
	void RegisterClass_Canvas();
	RegisterClass_Canvas();

	//45. CanvasGroup
	void RegisterClass_CanvasGroup();
	RegisterClass_CanvasGroup();

	//46. CanvasRenderer
	void RegisterClass_CanvasRenderer();
	RegisterClass_CanvasRenderer();

	//47. TrailRenderer
	void RegisterClass_TrailRenderer();
	RegisterClass_TrailRenderer();

	//48. ParticleRenderer
	void RegisterClass_ParticleRenderer();
	RegisterClass_ParticleRenderer();

	//49. ParticleSystemRenderer
	void RegisterClass_ParticleSystemRenderer();
	RegisterClass_ParticleSystemRenderer();

	//50. SpriteRenderer
	void RegisterClass_SpriteRenderer();
	RegisterClass_SpriteRenderer();

	//51. RuntimeAnimatorController
	void RegisterClass_RuntimeAnimatorController();
	RegisterClass_RuntimeAnimatorController();

	//52. PreloadData
	void RegisterClass_PreloadData();
	RegisterClass_PreloadData();

	//53. Cubemap
	void RegisterClass_Cubemap();
	RegisterClass_Cubemap();

	//54. Texture3D
	void RegisterClass_Texture3D();
	RegisterClass_Texture3D();

	//55. LevelGameManager
	void RegisterClass_LevelGameManager();
	RegisterClass_LevelGameManager();

	//56. CircleCollider2D
	void RegisterClass_CircleCollider2D();
	RegisterClass_CircleCollider2D();

	//57. PolygonCollider2D
	void RegisterClass_PolygonCollider2D();
	RegisterClass_PolygonCollider2D();

	//58. BoxCollider2D
	void RegisterClass_BoxCollider2D();
	RegisterClass_BoxCollider2D();

	//59. PhysicsMaterial2D
	void RegisterClass_PhysicsMaterial2D();
	RegisterClass_PhysicsMaterial2D();

	//60. EdgeCollider2D
	void RegisterClass_EdgeCollider2D();
	RegisterClass_EdgeCollider2D();

	//61. AnimationClip
	void RegisterClass_AnimationClip();
	RegisterClass_AnimationClip();

	//62. Motion
	void RegisterClass_Motion();
	RegisterClass_Motion();

	//63. AudioListener
	void RegisterClass_AudioListener();
	RegisterClass_AudioListener();

	//64. AnimatorController
	void RegisterClass_AnimatorController();
	RegisterClass_AnimatorController();

	//65. RenderSettings
	void RegisterClass_RenderSettings();
	RegisterClass_RenderSettings();

	//66. MonoScript
	void RegisterClass_MonoScript();
	RegisterClass_MonoScript();

	//67. FlareLayer
	void RegisterClass_FlareLayer();
	RegisterClass_FlareLayer();

	//68. LightmapSettings
	void RegisterClass_LightmapSettings();
	RegisterClass_LightmapSettings();

	//69. TimeManager
	void RegisterClass_TimeManager();
	RegisterClass_TimeManager();

	//70. AudioManager
	void RegisterClass_AudioManager();
	RegisterClass_AudioManager();

	//71. InputManager
	void RegisterClass_InputManager();
	RegisterClass_InputManager();

	//72. Physics2DSettings
	void RegisterClass_Physics2DSettings();
	RegisterClass_Physics2DSettings();

	//73. GraphicsSettings
	void RegisterClass_GraphicsSettings();
	RegisterClass_GraphicsSettings();

	//74. PhysicsManager
	void RegisterClass_PhysicsManager();
	RegisterClass_PhysicsManager();

	//75. TagManager
	void RegisterClass_TagManager();
	RegisterClass_TagManager();

	//76. ScriptMapper
	void RegisterClass_ScriptMapper();
	RegisterClass_ScriptMapper();

	//77. DelayedCallManager
	void RegisterClass_DelayedCallManager();
	RegisterClass_DelayedCallManager();

	//78. MonoManager
	void RegisterClass_MonoManager();
	RegisterClass_MonoManager();

	//79. NavMeshAreas
	void RegisterClass_NavMeshAreas();
	RegisterClass_NavMeshAreas();

	//80. PlayerSettings
	void RegisterClass_PlayerSettings();
	RegisterClass_PlayerSettings();

	//81. BuildSettings
	void RegisterClass_BuildSettings();
	RegisterClass_BuildSettings();

	//82. ResourceManager
	void RegisterClass_ResourceManager();
	RegisterClass_ResourceManager();

	//83. NetworkManager
	void RegisterClass_NetworkManager();
	RegisterClass_NetworkManager();

	//84. MasterServerInterface
	void RegisterClass_MasterServerInterface();
	RegisterClass_MasterServerInterface();

	//85. RuntimeInitializeOnLoadManager
	void RegisterClass_RuntimeInitializeOnLoadManager();
	RegisterClass_RuntimeInitializeOnLoadManager();

}
