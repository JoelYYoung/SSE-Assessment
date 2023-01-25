; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !29
  %tobool = icmp ne i32 %4, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %5, i32** %data, align 8, !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx1, align 4, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call3 = call i32* @wcscpy(i32* %7, i32* %arraydecay2) #4, !dbg !50
  %8 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %8), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #4, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #4, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 200, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = alloca i8, i64 400, align 16, !dbg !87
  %3 = bitcast i8* %2 to i32*, !dbg !88
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !86
  %4 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !89
  %tobool = icmp ne i32 %4, 0, !dbg !89
  br i1 %tobool, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !92
  br label %if.end, !dbg !94

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !95
  store i32* %5, i32** %data, align 8, !dbg !97
  %6 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !98
  store i32 0, i32* %arrayidx, align 4, !dbg !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !100, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !103
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !104
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx1, align 4, !dbg !106
  %7 = load i32*, i32** %data, align 8, !dbg !107
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call3 = call i32* @wcscpy(i32* %7, i32* %arraydecay2) #4, !dbg !109
  %8 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %8), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 200, align 16, !dbg !118
  %1 = bitcast i8* %0 to i32*, !dbg !119
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = alloca i8, i64 400, align 16, !dbg !122
  %3 = bitcast i8* %2 to i32*, !dbg !123
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !121
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !124
  %tobool = icmp ne i32 %4, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end, !dbg !126

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !127
  store i32* %5, i32** %data, align 8, !dbg !129
  %6 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  br label %if.end, !dbg !132

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !136
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !137
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx1, align 4, !dbg !139
  %7 = load i32*, i32** %data, align 8, !dbg !140
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !141
  %call3 = call i32* @wcscpy(i32* %7, i32* %arraydecay2) #4, !dbg !142
  %8 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %8), !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 8, scope: !15)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 14, scope: !33)
!35 = !DILocation(line: 33, column: 9, scope: !33)
!36 = !DILocation(line: 33, column: 17, scope: !33)
!37 = !DILocation(line: 34, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 36, column: 17, scope: !39)
!44 = !DILocation(line: 37, column: 17, scope: !39)
!45 = !DILocation(line: 37, column: 9, scope: !39)
!46 = !DILocation(line: 38, column: 9, scope: !39)
!47 = !DILocation(line: 38, column: 23, scope: !39)
!48 = !DILocation(line: 40, column: 16, scope: !39)
!49 = !DILocation(line: 40, column: 22, scope: !39)
!50 = !DILocation(line: 40, column: 9, scope: !39)
!51 = !DILocation(line: 41, column: 20, scope: !39)
!52 = !DILocation(line: 41, column: 9, scope: !39)
!53 = !DILocation(line: 43, column: 1, scope: !15)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_09_good", scope: !16, file: !16, line: 98, type: !17, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 100, column: 5, scope: !54)
!56 = !DILocation(line: 101, column: 5, scope: !54)
!57 = !DILocation(line: 102, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 114, type: !59, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !16, line: 114, type: !7)
!65 = !DILocation(line: 114, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !16, line: 114, type: !61)
!67 = !DILocation(line: 114, column: 27, scope: !58)
!68 = !DILocation(line: 117, column: 22, scope: !58)
!69 = !DILocation(line: 117, column: 12, scope: !58)
!70 = !DILocation(line: 117, column: 5, scope: !58)
!71 = !DILocation(line: 119, column: 5, scope: !58)
!72 = !DILocation(line: 120, column: 5, scope: !58)
!73 = !DILocation(line: 121, column: 5, scope: !58)
!74 = !DILocation(line: 124, column: 5, scope: !58)
!75 = !DILocation(line: 125, column: 5, scope: !58)
!76 = !DILocation(line: 126, column: 5, scope: !58)
!77 = !DILocation(line: 128, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !16, line: 52, type: !4)
!80 = !DILocation(line: 52, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !16, line: 53, type: !4)
!82 = !DILocation(line: 53, column: 15, scope: !78)
!83 = !DILocation(line: 53, column: 42, scope: !78)
!84 = !DILocation(line: 53, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !16, line: 54, type: !4)
!86 = !DILocation(line: 54, column: 15, scope: !78)
!87 = !DILocation(line: 54, column: 43, scope: !78)
!88 = !DILocation(line: 54, column: 32, scope: !78)
!89 = !DILocation(line: 55, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !16, line: 55, column: 8)
!91 = !DILocation(line: 55, column: 8, scope: !78)
!92 = !DILocation(line: 58, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !16, line: 56, column: 5)
!94 = !DILocation(line: 59, column: 5, scope: !93)
!95 = !DILocation(line: 63, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !16, line: 61, column: 5)
!97 = !DILocation(line: 63, column: 14, scope: !96)
!98 = !DILocation(line: 64, column: 9, scope: !96)
!99 = !DILocation(line: 64, column: 17, scope: !96)
!100 = !DILocalVariable(name: "source", scope: !101, file: !16, line: 67, type: !40)
!101 = distinct !DILexicalBlock(scope: !78, file: !16, line: 66, column: 5)
!102 = !DILocation(line: 67, column: 17, scope: !101)
!103 = !DILocation(line: 68, column: 17, scope: !101)
!104 = !DILocation(line: 68, column: 9, scope: !101)
!105 = !DILocation(line: 69, column: 9, scope: !101)
!106 = !DILocation(line: 69, column: 23, scope: !101)
!107 = !DILocation(line: 71, column: 16, scope: !101)
!108 = !DILocation(line: 71, column: 22, scope: !101)
!109 = !DILocation(line: 71, column: 9, scope: !101)
!110 = !DILocation(line: 72, column: 20, scope: !101)
!111 = !DILocation(line: 72, column: 9, scope: !101)
!112 = !DILocation(line: 74, column: 1, scope: !78)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !16, line: 79, type: !4)
!115 = !DILocation(line: 79, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !16, line: 80, type: !4)
!117 = !DILocation(line: 80, column: 15, scope: !113)
!118 = !DILocation(line: 80, column: 42, scope: !113)
!119 = !DILocation(line: 80, column: 31, scope: !113)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !16, line: 81, type: !4)
!121 = !DILocation(line: 81, column: 15, scope: !113)
!122 = !DILocation(line: 81, column: 43, scope: !113)
!123 = !DILocation(line: 81, column: 32, scope: !113)
!124 = !DILocation(line: 82, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !113, file: !16, line: 82, column: 8)
!126 = !DILocation(line: 82, column: 8, scope: !113)
!127 = !DILocation(line: 85, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !16, line: 83, column: 5)
!129 = !DILocation(line: 85, column: 14, scope: !128)
!130 = !DILocation(line: 86, column: 9, scope: !128)
!131 = !DILocation(line: 86, column: 17, scope: !128)
!132 = !DILocation(line: 87, column: 5, scope: !128)
!133 = !DILocalVariable(name: "source", scope: !134, file: !16, line: 89, type: !40)
!134 = distinct !DILexicalBlock(scope: !113, file: !16, line: 88, column: 5)
!135 = !DILocation(line: 89, column: 17, scope: !134)
!136 = !DILocation(line: 90, column: 17, scope: !134)
!137 = !DILocation(line: 90, column: 9, scope: !134)
!138 = !DILocation(line: 91, column: 9, scope: !134)
!139 = !DILocation(line: 91, column: 23, scope: !134)
!140 = !DILocation(line: 93, column: 16, scope: !134)
!141 = !DILocation(line: 93, column: 22, scope: !134)
!142 = !DILocation(line: 93, column: 9, scope: !134)
!143 = !DILocation(line: 94, column: 20, scope: !134)
!144 = !DILocation(line: 94, column: 9, scope: !134)
!145 = !DILocation(line: 96, column: 1, scope: !113)
