; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  %0 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !41
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %1 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call4 = call i32* @wcsncpy(i32* %1, i32* %arraydecay3, i64 99) #4, !dbg !46
  %2 = load i32*, i32** %data, align 8, !dbg !47
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !47
  store i32 0, i32* %arrayidx5, align 4, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %3), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #4, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #4, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !83
  store i32* %arraydecay, i32** %data, align 8, !dbg !86
  %0 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !92
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !93
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !94
  store i32 0, i32* %arrayidx2, align 4, !dbg !95
  %1 = load i32*, i32** %data, align 8, !dbg !96
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %call4 = call i32* @wcsncpy(i32* %1, i32* %arraydecay3, i64 99) #4, !dbg !98
  %2 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !99
  store i32 0, i32* %arrayidx5, align 4, !dbg !100
  %3 = load i32*, i32** %data, align 8, !dbg !101
  call void @printWLine(i32* %3), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %0 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !120
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !121
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx2, align 4, !dbg !123
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %call4 = call i32* @wcsncpy(i32* %1, i32* %arraydecay3, i64 99) #4, !dbg !126
  %2 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx5 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !127
  store i32 0, i32* %arrayidx5, align 4, !dbg !128
  %3 = load i32*, i32** %data, align 8, !dbg !129
  call void @printWLine(i32* %3), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 32, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !33, file: !12, line: 29, column: 5)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!34 = !DILocation(line: 32, column: 14, scope: !32)
!35 = !DILocation(line: 33, column: 9, scope: !32)
!36 = !DILocation(line: 33, column: 17, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 36, type: !27)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!39 = !DILocation(line: 36, column: 17, scope: !38)
!40 = !DILocation(line: 37, column: 17, scope: !38)
!41 = !DILocation(line: 37, column: 9, scope: !38)
!42 = !DILocation(line: 38, column: 9, scope: !38)
!43 = !DILocation(line: 38, column: 23, scope: !38)
!44 = !DILocation(line: 40, column: 17, scope: !38)
!45 = !DILocation(line: 40, column: 23, scope: !38)
!46 = !DILocation(line: 40, column: 9, scope: !38)
!47 = !DILocation(line: 41, column: 9, scope: !38)
!48 = !DILocation(line: 41, column: 21, scope: !38)
!49 = !DILocation(line: 42, column: 20, scope: !38)
!50 = !DILocation(line: 42, column: 9, scope: !38)
!51 = !DILocation(line: 44, column: 1, scope: !11)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_03_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 103, column: 5, scope: !52)
!54 = !DILocation(line: 104, column: 5, scope: !52)
!55 = !DILocation(line: 105, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !57, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 117, type: !19)
!63 = !DILocation(line: 117, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 117, type: !59)
!65 = !DILocation(line: 117, column: 27, scope: !56)
!66 = !DILocation(line: 120, column: 22, scope: !56)
!67 = !DILocation(line: 120, column: 12, scope: !56)
!68 = !DILocation(line: 120, column: 5, scope: !56)
!69 = !DILocation(line: 122, column: 5, scope: !56)
!70 = !DILocation(line: 123, column: 5, scope: !56)
!71 = !DILocation(line: 124, column: 5, scope: !56)
!72 = !DILocation(line: 127, column: 5, scope: !56)
!73 = !DILocation(line: 128, column: 5, scope: !56)
!74 = !DILocation(line: 129, column: 5, scope: !56)
!75 = !DILocation(line: 131, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 53, type: !16)
!78 = !DILocation(line: 53, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !12, line: 54, type: !22)
!80 = !DILocation(line: 54, column: 13, scope: !76)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !12, line: 55, type: !27)
!82 = !DILocation(line: 55, column: 13, scope: !76)
!83 = !DILocation(line: 64, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !85, file: !12, line: 62, column: 5)
!85 = distinct !DILexicalBlock(scope: !76, file: !12, line: 56, column: 8)
!86 = !DILocation(line: 64, column: 14, scope: !84)
!87 = !DILocation(line: 65, column: 9, scope: !84)
!88 = !DILocation(line: 65, column: 17, scope: !84)
!89 = !DILocalVariable(name: "source", scope: !90, file: !12, line: 68, type: !27)
!90 = distinct !DILexicalBlock(scope: !76, file: !12, line: 67, column: 5)
!91 = !DILocation(line: 68, column: 17, scope: !90)
!92 = !DILocation(line: 69, column: 17, scope: !90)
!93 = !DILocation(line: 69, column: 9, scope: !90)
!94 = !DILocation(line: 70, column: 9, scope: !90)
!95 = !DILocation(line: 70, column: 23, scope: !90)
!96 = !DILocation(line: 72, column: 17, scope: !90)
!97 = !DILocation(line: 72, column: 23, scope: !90)
!98 = !DILocation(line: 72, column: 9, scope: !90)
!99 = !DILocation(line: 73, column: 9, scope: !90)
!100 = !DILocation(line: 73, column: 21, scope: !90)
!101 = !DILocation(line: 74, column: 20, scope: !90)
!102 = !DILocation(line: 74, column: 9, scope: !90)
!103 = !DILocation(line: 76, column: 1, scope: !76)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 79, type: !13, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 81, type: !16)
!106 = !DILocation(line: 81, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 82, type: !22)
!108 = !DILocation(line: 82, column: 13, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 83, type: !27)
!110 = !DILocation(line: 83, column: 13, scope: !104)
!111 = !DILocation(line: 87, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !12, line: 85, column: 5)
!113 = distinct !DILexicalBlock(scope: !104, file: !12, line: 84, column: 8)
!114 = !DILocation(line: 87, column: 14, scope: !112)
!115 = !DILocation(line: 88, column: 9, scope: !112)
!116 = !DILocation(line: 88, column: 17, scope: !112)
!117 = !DILocalVariable(name: "source", scope: !118, file: !12, line: 91, type: !27)
!118 = distinct !DILexicalBlock(scope: !104, file: !12, line: 90, column: 5)
!119 = !DILocation(line: 91, column: 17, scope: !118)
!120 = !DILocation(line: 92, column: 17, scope: !118)
!121 = !DILocation(line: 92, column: 9, scope: !118)
!122 = !DILocation(line: 93, column: 9, scope: !118)
!123 = !DILocation(line: 93, column: 23, scope: !118)
!124 = !DILocation(line: 95, column: 17, scope: !118)
!125 = !DILocation(line: 95, column: 23, scope: !118)
!126 = !DILocation(line: 95, column: 9, scope: !118)
!127 = !DILocation(line: 96, column: 9, scope: !118)
!128 = !DILocation(line: 96, column: 21, scope: !118)
!129 = !DILocation(line: 97, column: 20, scope: !118)
!130 = !DILocation(line: 97, column: 9, scope: !118)
!131 = !DILocation(line: 99, column: 1, scope: !104)
