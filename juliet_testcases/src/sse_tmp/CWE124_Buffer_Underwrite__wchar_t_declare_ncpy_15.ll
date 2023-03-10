; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !35
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !36
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !37
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !38
  store i32 0, i32* %arrayidx4, align 4, !dbg !39
  %0 = load i32*, i32** %data, align 8, !dbg !40
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %call6 = call i32* @wcsncpy(i32* %0, i32* %arraydecay5, i64 99) #4, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx7 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !43
  store i32 0, i32* %arrayidx7, align 4, !dbg !44
  %2 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* %2), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #4, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #4, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !77
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !78
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !79
  store i32 0, i32* %arrayidx, align 4, !dbg !80
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !81
  store i32* %arraydecay1, i32** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !86
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !87
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx4, align 4, !dbg !89
  %0 = load i32*, i32** %data, align 8, !dbg !90
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !91
  %call6 = call i32* @wcsncpy(i32* %0, i32* %arraydecay5, i64 99) #4, !dbg !92
  %1 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx7 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !93
  store i32 0, i32* %arrayidx7, align 4, !dbg !94
  %2 = load i32*, i32** %data, align 8, !dbg !95
  call void @printWLine(i32* %2), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !103
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !104
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay1, i32** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !109, metadata !DIExpression()), !dbg !111
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !113
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !114
  store i32 0, i32* %arrayidx4, align 4, !dbg !115
  %0 = load i32*, i32** %data, align 8, !dbg !116
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call6 = call i32* @wcsncpy(i32* %0, i32* %arraydecay5, i64 99) #4, !dbg !118
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx7 = getelementptr inbounds i32, i32* %1, i64 99, !dbg !119
  store i32 0, i32* %arrayidx7, align 4, !dbg !120
  %2 = load i32*, i32** %data, align 8, !dbg !121
  call void @printWLine(i32* %2), !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 33, column: 16, scope: !11)
!31 = !DILocation(line: 33, column: 27, scope: !11)
!32 = !DILocation(line: 33, column: 14, scope: !11)
!33 = !DILocalVariable(name: "source", scope: !34, file: !12, line: 41, type: !22)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!35 = !DILocation(line: 41, column: 17, scope: !34)
!36 = !DILocation(line: 42, column: 17, scope: !34)
!37 = !DILocation(line: 42, column: 9, scope: !34)
!38 = !DILocation(line: 43, column: 9, scope: !34)
!39 = !DILocation(line: 43, column: 23, scope: !34)
!40 = !DILocation(line: 45, column: 17, scope: !34)
!41 = !DILocation(line: 45, column: 23, scope: !34)
!42 = !DILocation(line: 45, column: 9, scope: !34)
!43 = !DILocation(line: 47, column: 9, scope: !34)
!44 = !DILocation(line: 47, column: 21, scope: !34)
!45 = !DILocation(line: 48, column: 20, scope: !34)
!46 = !DILocation(line: 48, column: 9, scope: !34)
!47 = !DILocation(line: 50, column: 1, scope: !11)
!48 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_ncpy_15_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 118, column: 5, scope: !48)
!50 = !DILocation(line: 119, column: 5, scope: !48)
!51 = !DILocation(line: 120, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !53, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!19, !19, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !12, line: 132, type: !19)
!59 = !DILocation(line: 132, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !12, line: 132, type: !55)
!61 = !DILocation(line: 132, column: 27, scope: !52)
!62 = !DILocation(line: 135, column: 22, scope: !52)
!63 = !DILocation(line: 135, column: 12, scope: !52)
!64 = !DILocation(line: 135, column: 5, scope: !52)
!65 = !DILocation(line: 137, column: 5, scope: !52)
!66 = !DILocation(line: 138, column: 5, scope: !52)
!67 = !DILocation(line: 139, column: 5, scope: !52)
!68 = !DILocation(line: 142, column: 5, scope: !52)
!69 = !DILocation(line: 143, column: 5, scope: !52)
!70 = !DILocation(line: 144, column: 5, scope: !52)
!71 = !DILocation(line: 146, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 59, type: !16)
!74 = !DILocation(line: 59, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !12, line: 60, type: !22)
!76 = !DILocation(line: 60, column: 13, scope: !72)
!77 = !DILocation(line: 61, column: 13, scope: !72)
!78 = !DILocation(line: 61, column: 5, scope: !72)
!79 = !DILocation(line: 62, column: 5, scope: !72)
!80 = !DILocation(line: 62, column: 23, scope: !72)
!81 = !DILocation(line: 71, column: 16, scope: !72)
!82 = !DILocation(line: 71, column: 14, scope: !72)
!83 = !DILocalVariable(name: "source", scope: !84, file: !12, line: 75, type: !22)
!84 = distinct !DILexicalBlock(scope: !72, file: !12, line: 74, column: 5)
!85 = !DILocation(line: 75, column: 17, scope: !84)
!86 = !DILocation(line: 76, column: 17, scope: !84)
!87 = !DILocation(line: 76, column: 9, scope: !84)
!88 = !DILocation(line: 77, column: 9, scope: !84)
!89 = !DILocation(line: 77, column: 23, scope: !84)
!90 = !DILocation(line: 79, column: 17, scope: !84)
!91 = !DILocation(line: 79, column: 23, scope: !84)
!92 = !DILocation(line: 79, column: 9, scope: !84)
!93 = !DILocation(line: 81, column: 9, scope: !84)
!94 = !DILocation(line: 81, column: 21, scope: !84)
!95 = !DILocation(line: 82, column: 20, scope: !84)
!96 = !DILocation(line: 82, column: 9, scope: !84)
!97 = !DILocation(line: 84, column: 1, scope: !72)
!98 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 89, type: !16)
!100 = !DILocation(line: 89, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 90, type: !22)
!102 = !DILocation(line: 90, column: 13, scope: !98)
!103 = !DILocation(line: 91, column: 13, scope: !98)
!104 = !DILocation(line: 91, column: 5, scope: !98)
!105 = !DILocation(line: 92, column: 5, scope: !98)
!106 = !DILocation(line: 92, column: 23, scope: !98)
!107 = !DILocation(line: 97, column: 16, scope: !98)
!108 = !DILocation(line: 97, column: 14, scope: !98)
!109 = !DILocalVariable(name: "source", scope: !110, file: !12, line: 105, type: !22)
!110 = distinct !DILexicalBlock(scope: !98, file: !12, line: 104, column: 5)
!111 = !DILocation(line: 105, column: 17, scope: !110)
!112 = !DILocation(line: 106, column: 17, scope: !110)
!113 = !DILocation(line: 106, column: 9, scope: !110)
!114 = !DILocation(line: 107, column: 9, scope: !110)
!115 = !DILocation(line: 107, column: 23, scope: !110)
!116 = !DILocation(line: 109, column: 17, scope: !110)
!117 = !DILocation(line: 109, column: 23, scope: !110)
!118 = !DILocation(line: 109, column: 9, scope: !110)
!119 = !DILocation(line: 111, column: 9, scope: !110)
!120 = !DILocation(line: 111, column: 21, scope: !110)
!121 = !DILocation(line: 112, column: 20, scope: !110)
!122 = !DILocation(line: 112, column: 9, scope: !110)
!123 = !DILocation(line: 114, column: 1, scope: !98)
