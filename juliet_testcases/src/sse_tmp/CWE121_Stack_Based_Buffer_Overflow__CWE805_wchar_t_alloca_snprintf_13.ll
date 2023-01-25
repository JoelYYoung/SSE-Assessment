; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13_bad() #0 !dbg !15 {
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
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  store i32* %5, i32** %data, align 8, !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx1, align 4, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %7, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #4, !dbg !51
  %8 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %8), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #4, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #4, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 200, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %2 = alloca i8, i64 400, align 16, !dbg !88
  %3 = bitcast i8* %2 to i32*, !dbg !89
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !87
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !90
  %cmp = icmp ne i32 %4, 5, !dbg !92
  br i1 %cmp, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !94
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !97
  store i32* %5, i32** %data, align 8, !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !106
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx1, align 4, !dbg !108
  %7 = load i32*, i32** %data, align 8, !dbg !109
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %7, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #4, !dbg !111
  %8 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %8), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 200, align 16, !dbg !120
  %1 = bitcast i8* %0 to i32*, !dbg !121
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %2 = alloca i8, i64 400, align 16, !dbg !124
  %3 = bitcast i8* %2 to i32*, !dbg !125
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !123
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !126
  %cmp = icmp eq i32 %4, 5, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !130
  store i32* %5, i32** %data, align 8, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  br label %if.end, !dbg !135

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !139
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !140
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx1, align 4, !dbg !142
  %7 = load i32*, i32** %data, align 8, !dbg !143
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !144
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %7, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay2) #4, !dbg !145
  %8 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %8), !dbg !147
  ret void, !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13_bad", scope: !16, file: !16, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 32, type: !4)
!22 = !DILocation(line: 32, column: 15, scope: !15)
!23 = !DILocation(line: 32, column: 42, scope: !15)
!24 = !DILocation(line: 32, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 33, type: !4)
!26 = !DILocation(line: 33, column: 15, scope: !15)
!27 = !DILocation(line: 33, column: 43, scope: !15)
!28 = !DILocation(line: 33, column: 32, scope: !15)
!29 = !DILocation(line: 34, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 8)
!31 = !DILocation(line: 34, column: 25, scope: !30)
!32 = !DILocation(line: 34, column: 8, scope: !15)
!33 = !DILocation(line: 38, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 35, column: 5)
!35 = !DILocation(line: 38, column: 14, scope: !34)
!36 = !DILocation(line: 39, column: 9, scope: !34)
!37 = !DILocation(line: 39, column: 17, scope: !34)
!38 = !DILocation(line: 40, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !16, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 42, column: 17, scope: !40)
!45 = !DILocation(line: 43, column: 17, scope: !40)
!46 = !DILocation(line: 43, column: 9, scope: !40)
!47 = !DILocation(line: 44, column: 9, scope: !40)
!48 = !DILocation(line: 44, column: 23, scope: !40)
!49 = !DILocation(line: 46, column: 18, scope: !40)
!50 = !DILocation(line: 46, column: 36, scope: !40)
!51 = !DILocation(line: 46, column: 9, scope: !40)
!52 = !DILocation(line: 47, column: 20, scope: !40)
!53 = !DILocation(line: 47, column: 9, scope: !40)
!54 = !DILocation(line: 49, column: 1, scope: !15)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_snprintf_13_good", scope: !16, file: !16, line: 104, type: !17, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 106, column: 5, scope: !55)
!57 = !DILocation(line: 107, column: 5, scope: !55)
!58 = !DILocation(line: 108, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 120, type: !60, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 120, type: !7)
!66 = !DILocation(line: 120, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 120, type: !62)
!68 = !DILocation(line: 120, column: 27, scope: !59)
!69 = !DILocation(line: 123, column: 22, scope: !59)
!70 = !DILocation(line: 123, column: 12, scope: !59)
!71 = !DILocation(line: 123, column: 5, scope: !59)
!72 = !DILocation(line: 125, column: 5, scope: !59)
!73 = !DILocation(line: 126, column: 5, scope: !59)
!74 = !DILocation(line: 127, column: 5, scope: !59)
!75 = !DILocation(line: 130, column: 5, scope: !59)
!76 = !DILocation(line: 131, column: 5, scope: !59)
!77 = !DILocation(line: 132, column: 5, scope: !59)
!78 = !DILocation(line: 134, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !16, line: 58, type: !4)
!81 = !DILocation(line: 58, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !16, line: 59, type: !4)
!83 = !DILocation(line: 59, column: 15, scope: !79)
!84 = !DILocation(line: 59, column: 42, scope: !79)
!85 = !DILocation(line: 59, column: 31, scope: !79)
!86 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !16, line: 60, type: !4)
!87 = !DILocation(line: 60, column: 15, scope: !79)
!88 = !DILocation(line: 60, column: 43, scope: !79)
!89 = !DILocation(line: 60, column: 32, scope: !79)
!90 = !DILocation(line: 61, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !16, line: 61, column: 8)
!92 = !DILocation(line: 61, column: 25, scope: !91)
!93 = !DILocation(line: 61, column: 8, scope: !79)
!94 = !DILocation(line: 64, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !16, line: 62, column: 5)
!96 = !DILocation(line: 65, column: 5, scope: !95)
!97 = !DILocation(line: 69, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !16, line: 67, column: 5)
!99 = !DILocation(line: 69, column: 14, scope: !98)
!100 = !DILocation(line: 70, column: 9, scope: !98)
!101 = !DILocation(line: 70, column: 17, scope: !98)
!102 = !DILocalVariable(name: "source", scope: !103, file: !16, line: 73, type: !41)
!103 = distinct !DILexicalBlock(scope: !79, file: !16, line: 72, column: 5)
!104 = !DILocation(line: 73, column: 17, scope: !103)
!105 = !DILocation(line: 74, column: 17, scope: !103)
!106 = !DILocation(line: 74, column: 9, scope: !103)
!107 = !DILocation(line: 75, column: 9, scope: !103)
!108 = !DILocation(line: 75, column: 23, scope: !103)
!109 = !DILocation(line: 77, column: 18, scope: !103)
!110 = !DILocation(line: 77, column: 36, scope: !103)
!111 = !DILocation(line: 77, column: 9, scope: !103)
!112 = !DILocation(line: 78, column: 20, scope: !103)
!113 = !DILocation(line: 78, column: 9, scope: !103)
!114 = !DILocation(line: 80, column: 1, scope: !79)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !16, line: 85, type: !4)
!117 = !DILocation(line: 85, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !16, line: 86, type: !4)
!119 = !DILocation(line: 86, column: 15, scope: !115)
!120 = !DILocation(line: 86, column: 42, scope: !115)
!121 = !DILocation(line: 86, column: 31, scope: !115)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !16, line: 87, type: !4)
!123 = !DILocation(line: 87, column: 15, scope: !115)
!124 = !DILocation(line: 87, column: 43, scope: !115)
!125 = !DILocation(line: 87, column: 32, scope: !115)
!126 = !DILocation(line: 88, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !115, file: !16, line: 88, column: 8)
!128 = !DILocation(line: 88, column: 25, scope: !127)
!129 = !DILocation(line: 88, column: 8, scope: !115)
!130 = !DILocation(line: 91, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !16, line: 89, column: 5)
!132 = !DILocation(line: 91, column: 14, scope: !131)
!133 = !DILocation(line: 92, column: 9, scope: !131)
!134 = !DILocation(line: 92, column: 17, scope: !131)
!135 = !DILocation(line: 93, column: 5, scope: !131)
!136 = !DILocalVariable(name: "source", scope: !137, file: !16, line: 95, type: !41)
!137 = distinct !DILexicalBlock(scope: !115, file: !16, line: 94, column: 5)
!138 = !DILocation(line: 95, column: 17, scope: !137)
!139 = !DILocation(line: 96, column: 17, scope: !137)
!140 = !DILocation(line: 96, column: 9, scope: !137)
!141 = !DILocation(line: 97, column: 9, scope: !137)
!142 = !DILocation(line: 97, column: 23, scope: !137)
!143 = !DILocation(line: 99, column: 18, scope: !137)
!144 = !DILocation(line: 99, column: 36, scope: !137)
!145 = !DILocation(line: 99, column: 9, scope: !137)
!146 = !DILocation(line: 100, column: 20, scope: !137)
!147 = !DILocation(line: 100, column: 9, scope: !137)
!148 = !DILocation(line: 102, column: 1, scope: !115)
