; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_34.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data2 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !34
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !37
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !38
  store i32* %add.ptr, i32** %data, align 8, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType* %myUnion to i32**, !dbg !41
  store i32* %0, i32** %unionFirst, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType* %myUnion to i32**, !dbg !46
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !46
  store i32* %1, i32** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 199) #4, !dbg !54
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !57
  %2 = load i32*, i32** %data2, align 8, !dbg !58
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %2) #4, !dbg !59
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* %arraydecay8), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_34_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #4, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #4, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_34_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_34_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data2 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata %union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType* %myUnion, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !93
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !94
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !97
  store i32* %arraydecay1, i32** %data, align 8, !dbg !98
  %0 = load i32*, i32** %data, align 8, !dbg !99
  %unionFirst = bitcast %union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType* %myUnion to i32**, !dbg !100
  store i32* %0, i32** %unionFirst, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !102, metadata !DIExpression()), !dbg !104
  %unionSecond = bitcast %union.CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType* %myUnion to i32**, !dbg !105
  %1 = load i32*, i32** %unionSecond, align 8, !dbg !105
  store i32* %1, i32** %data2, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !106, metadata !DIExpression()), !dbg !108
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !109
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 199) #4, !dbg !110
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !111
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !113
  %2 = load i32*, i32** %data2, align 8, !dbg !114
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %2) #4, !dbg !115
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !116
  call void @printWLine(i32* %arraydecay8), !dbg !117
  ret void, !dbg !118
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_34.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 31, column: 15, scope: !11)
!21 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_34_unionType", file: !12, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !12, line: 23, baseType: !16, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !12, line: 24, baseType: !16, size: 64)
!27 = !DILocation(line: 32, column: 63, scope: !11)
!28 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 13, scope: !11)
!33 = !DILocation(line: 34, column: 13, scope: !11)
!34 = !DILocation(line: 34, column: 5, scope: !11)
!35 = !DILocation(line: 35, column: 5, scope: !11)
!36 = !DILocation(line: 35, column: 23, scope: !11)
!37 = !DILocation(line: 37, column: 12, scope: !11)
!38 = !DILocation(line: 37, column: 23, scope: !11)
!39 = !DILocation(line: 37, column: 10, scope: !11)
!40 = !DILocation(line: 38, column: 26, scope: !11)
!41 = !DILocation(line: 38, column: 13, scope: !11)
!42 = !DILocation(line: 38, column: 24, scope: !11)
!43 = !DILocalVariable(name: "data", scope: !44, file: !12, line: 40, type: !16)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!45 = !DILocation(line: 40, column: 19, scope: !44)
!46 = !DILocation(line: 40, column: 34, scope: !44)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 42, type: !49)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 41, column: 9)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 200)
!52 = !DILocation(line: 42, column: 21, scope: !48)
!53 = !DILocation(line: 43, column: 21, scope: !48)
!54 = !DILocation(line: 43, column: 13, scope: !48)
!55 = !DILocation(line: 44, column: 13, scope: !48)
!56 = !DILocation(line: 44, column: 27, scope: !48)
!57 = !DILocation(line: 46, column: 20, scope: !48)
!58 = !DILocation(line: 46, column: 26, scope: !48)
!59 = !DILocation(line: 46, column: 13, scope: !48)
!60 = !DILocation(line: 47, column: 24, scope: !48)
!61 = !DILocation(line: 47, column: 13, scope: !48)
!62 = !DILocation(line: 50, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_34_good", scope: !12, file: !12, line: 80, type: !13, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 82, column: 5, scope: !63)
!65 = !DILocation(line: 83, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !67, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!19, !19, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !12, line: 94, type: !19)
!73 = !DILocation(line: 94, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !12, line: 94, type: !69)
!75 = !DILocation(line: 94, column: 27, scope: !66)
!76 = !DILocation(line: 97, column: 22, scope: !66)
!77 = !DILocation(line: 97, column: 12, scope: !66)
!78 = !DILocation(line: 97, column: 5, scope: !66)
!79 = !DILocation(line: 99, column: 5, scope: !66)
!80 = !DILocation(line: 100, column: 5, scope: !66)
!81 = !DILocation(line: 101, column: 5, scope: !66)
!82 = !DILocation(line: 104, column: 5, scope: !66)
!83 = !DILocation(line: 105, column: 5, scope: !66)
!84 = !DILocation(line: 106, column: 5, scope: !66)
!85 = !DILocation(line: 108, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", scope: !86, file: !12, line: 59, type: !16)
!88 = !DILocation(line: 59, column: 15, scope: !86)
!89 = !DILocalVariable(name: "myUnion", scope: !86, file: !12, line: 60, type: !22)
!90 = !DILocation(line: 60, column: 63, scope: !86)
!91 = !DILocalVariable(name: "dataBuffer", scope: !86, file: !12, line: 61, type: !29)
!92 = !DILocation(line: 61, column: 13, scope: !86)
!93 = !DILocation(line: 62, column: 13, scope: !86)
!94 = !DILocation(line: 62, column: 5, scope: !86)
!95 = !DILocation(line: 63, column: 5, scope: !86)
!96 = !DILocation(line: 63, column: 23, scope: !86)
!97 = !DILocation(line: 65, column: 12, scope: !86)
!98 = !DILocation(line: 65, column: 10, scope: !86)
!99 = !DILocation(line: 66, column: 26, scope: !86)
!100 = !DILocation(line: 66, column: 13, scope: !86)
!101 = !DILocation(line: 66, column: 24, scope: !86)
!102 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 68, type: !16)
!103 = distinct !DILexicalBlock(scope: !86, file: !12, line: 67, column: 5)
!104 = !DILocation(line: 68, column: 19, scope: !103)
!105 = !DILocation(line: 68, column: 34, scope: !103)
!106 = !DILocalVariable(name: "dest", scope: !107, file: !12, line: 70, type: !49)
!107 = distinct !DILexicalBlock(scope: !103, file: !12, line: 69, column: 9)
!108 = !DILocation(line: 70, column: 21, scope: !107)
!109 = !DILocation(line: 71, column: 21, scope: !107)
!110 = !DILocation(line: 71, column: 13, scope: !107)
!111 = !DILocation(line: 72, column: 13, scope: !107)
!112 = !DILocation(line: 72, column: 27, scope: !107)
!113 = !DILocation(line: 74, column: 20, scope: !107)
!114 = !DILocation(line: 74, column: 26, scope: !107)
!115 = !DILocation(line: 74, column: 13, scope: !107)
!116 = !DILocation(line: 75, column: 24, scope: !107)
!117 = !DILocation(line: 75, column: 13, scope: !107)
!118 = !DILocation(line: 78, column: 1, scope: !86)
