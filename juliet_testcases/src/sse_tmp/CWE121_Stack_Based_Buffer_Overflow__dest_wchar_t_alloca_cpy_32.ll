; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %5 = load i32*, i32** %4, align 8, !dbg !38
  store i32* %5, i32** %data1, align 8, !dbg !36
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  store i32* %6, i32** %data1, align 8, !dbg !40
  %7 = load i32*, i32** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %8 = load i32*, i32** %data1, align 8, !dbg !43
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !44
  store i32* %8, i32** %9, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !49
  %11 = load i32*, i32** %10, align 8, !dbg !50
  store i32* %11, i32** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx3, align 4, !dbg !60
  %12 = load i32*, i32** %data2, align 8, !dbg !61
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !62
  %call5 = call i32* @wcscpy(i32* %12, i32* %arraydecay4) #4, !dbg !63
  %13 = load i32*, i32** %data2, align 8, !dbg !64
  call void @printWLine(i32* %13), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32_good() #0 !dbg !67 {
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
  %call = call i64 @time(i64* null) #4, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #4, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !95, metadata !DIExpression()), !dbg !96
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 200, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %2 = alloca i8, i64 400, align 16, !dbg !103
  %3 = bitcast i8* %2 to i32*, !dbg !104
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !108
  %5 = load i32*, i32** %4, align 8, !dbg !109
  store i32* %5, i32** %data1, align 8, !dbg !107
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  store i32* %6, i32** %data1, align 8, !dbg !111
  %7 = load i32*, i32** %data1, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %8 = load i32*, i32** %data1, align 8, !dbg !114
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !115
  store i32* %8, i32** %9, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !117, metadata !DIExpression()), !dbg !119
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !120
  %11 = load i32*, i32** %10, align 8, !dbg !121
  store i32* %11, i32** %data2, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !126
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx3, align 4, !dbg !128
  %12 = load i32*, i32** %data2, align 8, !dbg !129
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call5 = call i32* @wcscpy(i32* %12, i32* %arraydecay4) #4, !dbg !131
  %13 = load i32*, i32** %data2, align 8, !dbg !132
  call void @printWLine(i32* %13), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 42, scope: !15)
!29 = !DILocation(line: 28, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 29, type: !4)
!31 = !DILocation(line: 29, column: 15, scope: !15)
!32 = !DILocation(line: 29, column: 43, scope: !15)
!33 = !DILocation(line: 29, column: 32, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 31, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 30, column: 5)
!36 = !DILocation(line: 31, column: 19, scope: !35)
!37 = !DILocation(line: 31, column: 27, scope: !35)
!38 = !DILocation(line: 31, column: 26, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 14, scope: !35)
!41 = !DILocation(line: 35, column: 9, scope: !35)
!42 = !DILocation(line: 35, column: 17, scope: !35)
!43 = !DILocation(line: 36, column: 21, scope: !35)
!44 = !DILocation(line: 36, column: 10, scope: !35)
!45 = !DILocation(line: 36, column: 19, scope: !35)
!46 = !DILocalVariable(name: "data", scope: !47, file: !16, line: 39, type: !4)
!47 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 19, scope: !47)
!49 = !DILocation(line: 39, column: 27, scope: !47)
!50 = !DILocation(line: 39, column: 26, scope: !47)
!51 = !DILocalVariable(name: "source", scope: !52, file: !16, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !16, line: 40, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 41, column: 21, scope: !52)
!57 = !DILocation(line: 42, column: 21, scope: !52)
!58 = !DILocation(line: 42, column: 13, scope: !52)
!59 = !DILocation(line: 43, column: 13, scope: !52)
!60 = !DILocation(line: 43, column: 27, scope: !52)
!61 = !DILocation(line: 45, column: 20, scope: !52)
!62 = !DILocation(line: 45, column: 26, scope: !52)
!63 = !DILocation(line: 45, column: 13, scope: !52)
!64 = !DILocation(line: 46, column: 24, scope: !52)
!65 = !DILocation(line: 46, column: 13, scope: !52)
!66 = !DILocation(line: 49, column: 1, scope: !15)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_32_good", scope: !16, file: !16, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 85, column: 5, scope: !67)
!69 = !DILocation(line: 86, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 97, type: !71, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !16, line: 97, type: !7)
!77 = !DILocation(line: 97, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !16, line: 97, type: !73)
!79 = !DILocation(line: 97, column: 27, scope: !70)
!80 = !DILocation(line: 100, column: 22, scope: !70)
!81 = !DILocation(line: 100, column: 12, scope: !70)
!82 = !DILocation(line: 100, column: 5, scope: !70)
!83 = !DILocation(line: 102, column: 5, scope: !70)
!84 = !DILocation(line: 103, column: 5, scope: !70)
!85 = !DILocation(line: 104, column: 5, scope: !70)
!86 = !DILocation(line: 107, column: 5, scope: !70)
!87 = !DILocation(line: 108, column: 5, scope: !70)
!88 = !DILocation(line: 109, column: 5, scope: !70)
!89 = !DILocation(line: 111, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !16, line: 58, type: !4)
!92 = !DILocation(line: 58, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataPtr1", scope: !90, file: !16, line: 59, type: !22)
!94 = !DILocation(line: 59, column: 16, scope: !90)
!95 = !DILocalVariable(name: "dataPtr2", scope: !90, file: !16, line: 60, type: !22)
!96 = !DILocation(line: 60, column: 16, scope: !90)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !90, file: !16, line: 61, type: !4)
!98 = !DILocation(line: 61, column: 15, scope: !90)
!99 = !DILocation(line: 61, column: 42, scope: !90)
!100 = !DILocation(line: 61, column: 31, scope: !90)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !90, file: !16, line: 62, type: !4)
!102 = !DILocation(line: 62, column: 15, scope: !90)
!103 = !DILocation(line: 62, column: 43, scope: !90)
!104 = !DILocation(line: 62, column: 32, scope: !90)
!105 = !DILocalVariable(name: "data", scope: !106, file: !16, line: 64, type: !4)
!106 = distinct !DILexicalBlock(scope: !90, file: !16, line: 63, column: 5)
!107 = !DILocation(line: 64, column: 19, scope: !106)
!108 = !DILocation(line: 64, column: 27, scope: !106)
!109 = !DILocation(line: 64, column: 26, scope: !106)
!110 = !DILocation(line: 66, column: 16, scope: !106)
!111 = !DILocation(line: 66, column: 14, scope: !106)
!112 = !DILocation(line: 67, column: 9, scope: !106)
!113 = !DILocation(line: 67, column: 17, scope: !106)
!114 = !DILocation(line: 68, column: 21, scope: !106)
!115 = !DILocation(line: 68, column: 10, scope: !106)
!116 = !DILocation(line: 68, column: 19, scope: !106)
!117 = !DILocalVariable(name: "data", scope: !118, file: !16, line: 71, type: !4)
!118 = distinct !DILexicalBlock(scope: !90, file: !16, line: 70, column: 5)
!119 = !DILocation(line: 71, column: 19, scope: !118)
!120 = !DILocation(line: 71, column: 27, scope: !118)
!121 = !DILocation(line: 71, column: 26, scope: !118)
!122 = !DILocalVariable(name: "source", scope: !123, file: !16, line: 73, type: !53)
!123 = distinct !DILexicalBlock(scope: !118, file: !16, line: 72, column: 9)
!124 = !DILocation(line: 73, column: 21, scope: !123)
!125 = !DILocation(line: 74, column: 21, scope: !123)
!126 = !DILocation(line: 74, column: 13, scope: !123)
!127 = !DILocation(line: 75, column: 13, scope: !123)
!128 = !DILocation(line: 75, column: 27, scope: !123)
!129 = !DILocation(line: 77, column: 20, scope: !123)
!130 = !DILocation(line: 77, column: 26, scope: !123)
!131 = !DILocation(line: 77, column: 13, scope: !123)
!132 = !DILocation(line: 78, column: 24, scope: !123)
!133 = !DILocation(line: 78, column: 13, scope: !123)
!134 = !DILocation(line: 81, column: 1, scope: !90)
