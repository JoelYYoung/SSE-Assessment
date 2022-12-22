; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %1 = load i32*, i32** %0, align 8, !dbg !40
  store i32* %1, i32** %data1, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %3 = load i32*, i32** %data1, align 8, !dbg !45
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %3, i32** %4, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %6 = load i32*, i32** %5, align 8, !dbg !52
  store i32* %6, i32** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %7 = load i32*, i32** %data2, align 8, !dbg !60
  %8 = bitcast i32* %7 to i8*, !dbg !61
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !61
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !61
  %10 = load i32*, i32** %data2, align 8, !dbg !62
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !62
  store i32 0, i32* %arrayidx6, align 4, !dbg !63
  %11 = load i32*, i32** %data2, align 8, !dbg !64
  call void @printWLine(i32* %11), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !104
  %1 = load i32*, i32** %0, align 8, !dbg !105
  store i32* %1, i32** %data1, align 8, !dbg !103
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store i32* %arraydecay, i32** %data1, align 8, !dbg !107
  %2 = load i32*, i32** %data1, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %3 = load i32*, i32** %data1, align 8, !dbg !110
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !111
  store i32* %3, i32** %4, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !113, metadata !DIExpression()), !dbg !115
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !116
  %6 = load i32*, i32** %5, align 8, !dbg !117
  store i32* %6, i32** %data2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %call = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #5, !dbg !122
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx4, align 4, !dbg !124
  %7 = load i32*, i32** %data2, align 8, !dbg !125
  %8 = bitcast i32* %7 to i8*, !dbg !126
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !126
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !126
  %10 = load i32*, i32** %data2, align 8, !dbg !127
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 99, !dbg !127
  store i32 0, i32* %arrayidx6, align 4, !dbg !128
  %11 = load i32*, i32** %data2, align 8, !dbg !129
  call void @printWLine(i32* %11), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 29, column: 13, scope: !11)
!36 = !DILocalVariable(name: "data", scope: !37, file: !12, line: 31, type: !16)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!38 = !DILocation(line: 31, column: 19, scope: !37)
!39 = !DILocation(line: 31, column: 27, scope: !37)
!40 = !DILocation(line: 31, column: 26, scope: !37)
!41 = !DILocation(line: 34, column: 16, scope: !37)
!42 = !DILocation(line: 34, column: 14, scope: !37)
!43 = !DILocation(line: 35, column: 9, scope: !37)
!44 = !DILocation(line: 35, column: 17, scope: !37)
!45 = !DILocation(line: 36, column: 21, scope: !37)
!46 = !DILocation(line: 36, column: 10, scope: !37)
!47 = !DILocation(line: 36, column: 19, scope: !37)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 39, type: !16)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!50 = !DILocation(line: 39, column: 19, scope: !49)
!51 = !DILocation(line: 39, column: 27, scope: !49)
!52 = !DILocation(line: 39, column: 26, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 41, type: !32)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 40, column: 9)
!55 = !DILocation(line: 41, column: 21, scope: !54)
!56 = !DILocation(line: 42, column: 21, scope: !54)
!57 = !DILocation(line: 42, column: 13, scope: !54)
!58 = !DILocation(line: 43, column: 13, scope: !54)
!59 = !DILocation(line: 43, column: 27, scope: !54)
!60 = !DILocation(line: 45, column: 21, scope: !54)
!61 = !DILocation(line: 45, column: 13, scope: !54)
!62 = !DILocation(line: 46, column: 13, scope: !54)
!63 = !DILocation(line: 46, column: 25, scope: !54)
!64 = !DILocation(line: 47, column: 24, scope: !54)
!65 = !DILocation(line: 47, column: 13, scope: !54)
!66 = !DILocation(line: 50, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_memmove_32_good", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 87, column: 5, scope: !67)
!69 = !DILocation(line: 88, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !71, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!19, !19, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 99, type: !19)
!77 = !DILocation(line: 99, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 99, type: !73)
!79 = !DILocation(line: 99, column: 27, scope: !70)
!80 = !DILocation(line: 102, column: 22, scope: !70)
!81 = !DILocation(line: 102, column: 12, scope: !70)
!82 = !DILocation(line: 102, column: 5, scope: !70)
!83 = !DILocation(line: 104, column: 5, scope: !70)
!84 = !DILocation(line: 105, column: 5, scope: !70)
!85 = !DILocation(line: 106, column: 5, scope: !70)
!86 = !DILocation(line: 109, column: 5, scope: !70)
!87 = !DILocation(line: 110, column: 5, scope: !70)
!88 = !DILocation(line: 111, column: 5, scope: !70)
!89 = !DILocation(line: 113, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 59, type: !16)
!92 = !DILocation(line: 59, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataPtr1", scope: !90, file: !12, line: 60, type: !22)
!94 = !DILocation(line: 60, column: 16, scope: !90)
!95 = !DILocalVariable(name: "dataPtr2", scope: !90, file: !12, line: 61, type: !22)
!96 = !DILocation(line: 61, column: 16, scope: !90)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !12, line: 62, type: !27)
!98 = !DILocation(line: 62, column: 13, scope: !90)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !12, line: 63, type: !32)
!100 = !DILocation(line: 63, column: 13, scope: !90)
!101 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 65, type: !16)
!102 = distinct !DILexicalBlock(scope: !90, file: !12, line: 64, column: 5)
!103 = !DILocation(line: 65, column: 19, scope: !102)
!104 = !DILocation(line: 65, column: 27, scope: !102)
!105 = !DILocation(line: 65, column: 26, scope: !102)
!106 = !DILocation(line: 67, column: 16, scope: !102)
!107 = !DILocation(line: 67, column: 14, scope: !102)
!108 = !DILocation(line: 68, column: 9, scope: !102)
!109 = !DILocation(line: 68, column: 17, scope: !102)
!110 = !DILocation(line: 69, column: 21, scope: !102)
!111 = !DILocation(line: 69, column: 10, scope: !102)
!112 = !DILocation(line: 69, column: 19, scope: !102)
!113 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 72, type: !16)
!114 = distinct !DILexicalBlock(scope: !90, file: !12, line: 71, column: 5)
!115 = !DILocation(line: 72, column: 19, scope: !114)
!116 = !DILocation(line: 72, column: 27, scope: !114)
!117 = !DILocation(line: 72, column: 26, scope: !114)
!118 = !DILocalVariable(name: "source", scope: !119, file: !12, line: 74, type: !32)
!119 = distinct !DILexicalBlock(scope: !114, file: !12, line: 73, column: 9)
!120 = !DILocation(line: 74, column: 21, scope: !119)
!121 = !DILocation(line: 75, column: 21, scope: !119)
!122 = !DILocation(line: 75, column: 13, scope: !119)
!123 = !DILocation(line: 76, column: 13, scope: !119)
!124 = !DILocation(line: 76, column: 27, scope: !119)
!125 = !DILocation(line: 78, column: 21, scope: !119)
!126 = !DILocation(line: 78, column: 13, scope: !119)
!127 = !DILocation(line: 79, column: 13, scope: !119)
!128 = !DILocation(line: 79, column: 25, scope: !119)
!129 = !DILocation(line: 80, column: 24, scope: !119)
!130 = !DILocation(line: 80, column: 13, scope: !119)
!131 = !DILocation(line: 83, column: 1, scope: !90)
