; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !51
  store i32 0, i32* %arrayidx5, align 4, !dbg !52
  %8 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* %8), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #4, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #4, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %0 = alloca i8, i64 400, align 16, !dbg !85
  %1 = bitcast i8* %0 to i32*, !dbg !86
  store i32* %1, i32** %dataBuffer, align 8, !dbg !84
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !87
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !88
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !91
  %cmp = icmp ne i32 %4, 5, !dbg !93
  br i1 %cmp, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !98
  store i32* %5, i32** %data, align 8, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !104
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !106
  store i32 0, i32* %arrayidx2, align 4, !dbg !107
  %6 = load i32*, i32** %data, align 8, !dbg !108
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !110
  %7 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !111
  store i32 0, i32* %arrayidx5, align 4, !dbg !112
  %8 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %8), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 400, align 16, !dbg !121
  %1 = bitcast i8* %0 to i32*, !dbg !122
  store i32* %1, i32** %dataBuffer, align 8, !dbg !120
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !123
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !124
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !127
  %cmp = icmp eq i32 %4, 5, !dbg !129
  br i1 %cmp, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !131
  store i32* %5, i32** %data, align 8, !dbg !133
  br label %if.end, !dbg !134

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !135, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !138
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !139
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !140
  store i32 0, i32* %arrayidx2, align 4, !dbg !141
  %6 = load i32*, i32** %data, align 8, !dbg !142
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !143
  %call4 = call i32* @wcsncpy(i32* %6, i32* %arraydecay3, i64 99) #4, !dbg !144
  %7 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !145
  store i32 0, i32* %arrayidx5, align 4, !dbg !146
  %8 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* %8), !dbg !148
  ret void, !dbg !149
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 13, scope: !15)
!26 = !DILocation(line: 27, column: 5, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 28, column: 23, scope: !15)
!29 = !DILocation(line: 29, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 8)
!31 = !DILocation(line: 29, column: 25, scope: !30)
!32 = !DILocation(line: 29, column: 8, scope: !15)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 30, column: 5)
!35 = !DILocation(line: 32, column: 27, scope: !34)
!36 = !DILocation(line: 32, column: 14, scope: !34)
!37 = !DILocation(line: 33, column: 5, scope: !34)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 35, column: 17, scope: !39)
!44 = !DILocation(line: 36, column: 17, scope: !39)
!45 = !DILocation(line: 36, column: 9, scope: !39)
!46 = !DILocation(line: 37, column: 9, scope: !39)
!47 = !DILocation(line: 37, column: 23, scope: !39)
!48 = !DILocation(line: 39, column: 17, scope: !39)
!49 = !DILocation(line: 39, column: 23, scope: !39)
!50 = !DILocation(line: 39, column: 9, scope: !39)
!51 = !DILocation(line: 41, column: 9, scope: !39)
!52 = !DILocation(line: 41, column: 21, scope: !39)
!53 = !DILocation(line: 42, column: 20, scope: !39)
!54 = !DILocation(line: 42, column: 9, scope: !39)
!55 = !DILocation(line: 44, column: 1, scope: !15)
!56 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_13_good", scope: !16, file: !16, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 105, column: 5, scope: !56)
!58 = !DILocation(line: 106, column: 5, scope: !56)
!59 = !DILocation(line: 107, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 119, type: !61, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!7, !7, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !16, line: 119, type: !7)
!67 = !DILocation(line: 119, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !16, line: 119, type: !63)
!69 = !DILocation(line: 119, column: 27, scope: !60)
!70 = !DILocation(line: 122, column: 22, scope: !60)
!71 = !DILocation(line: 122, column: 12, scope: !60)
!72 = !DILocation(line: 122, column: 5, scope: !60)
!73 = !DILocation(line: 124, column: 5, scope: !60)
!74 = !DILocation(line: 125, column: 5, scope: !60)
!75 = !DILocation(line: 126, column: 5, scope: !60)
!76 = !DILocation(line: 129, column: 5, scope: !60)
!77 = !DILocation(line: 130, column: 5, scope: !60)
!78 = !DILocation(line: 131, column: 5, scope: !60)
!79 = !DILocation(line: 133, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !16, line: 53, type: !4)
!82 = !DILocation(line: 53, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !16, line: 54, type: !4)
!84 = !DILocation(line: 54, column: 15, scope: !80)
!85 = !DILocation(line: 54, column: 39, scope: !80)
!86 = !DILocation(line: 54, column: 28, scope: !80)
!87 = !DILocation(line: 55, column: 13, scope: !80)
!88 = !DILocation(line: 55, column: 5, scope: !80)
!89 = !DILocation(line: 56, column: 5, scope: !80)
!90 = !DILocation(line: 56, column: 23, scope: !80)
!91 = !DILocation(line: 57, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !80, file: !16, line: 57, column: 8)
!93 = !DILocation(line: 57, column: 25, scope: !92)
!94 = !DILocation(line: 57, column: 8, scope: !80)
!95 = !DILocation(line: 60, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !16, line: 58, column: 5)
!97 = !DILocation(line: 61, column: 5, scope: !96)
!98 = !DILocation(line: 65, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !16, line: 63, column: 5)
!100 = !DILocation(line: 65, column: 14, scope: !99)
!101 = !DILocalVariable(name: "source", scope: !102, file: !16, line: 68, type: !40)
!102 = distinct !DILexicalBlock(scope: !80, file: !16, line: 67, column: 5)
!103 = !DILocation(line: 68, column: 17, scope: !102)
!104 = !DILocation(line: 69, column: 17, scope: !102)
!105 = !DILocation(line: 69, column: 9, scope: !102)
!106 = !DILocation(line: 70, column: 9, scope: !102)
!107 = !DILocation(line: 70, column: 23, scope: !102)
!108 = !DILocation(line: 72, column: 17, scope: !102)
!109 = !DILocation(line: 72, column: 23, scope: !102)
!110 = !DILocation(line: 72, column: 9, scope: !102)
!111 = !DILocation(line: 74, column: 9, scope: !102)
!112 = !DILocation(line: 74, column: 21, scope: !102)
!113 = !DILocation(line: 75, column: 20, scope: !102)
!114 = !DILocation(line: 75, column: 9, scope: !102)
!115 = !DILocation(line: 77, column: 1, scope: !80)
!116 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "data", scope: !116, file: !16, line: 82, type: !4)
!118 = !DILocation(line: 82, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !16, line: 83, type: !4)
!120 = !DILocation(line: 83, column: 15, scope: !116)
!121 = !DILocation(line: 83, column: 39, scope: !116)
!122 = !DILocation(line: 83, column: 28, scope: !116)
!123 = !DILocation(line: 84, column: 13, scope: !116)
!124 = !DILocation(line: 84, column: 5, scope: !116)
!125 = !DILocation(line: 85, column: 5, scope: !116)
!126 = !DILocation(line: 85, column: 23, scope: !116)
!127 = !DILocation(line: 86, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !116, file: !16, line: 86, column: 8)
!129 = !DILocation(line: 86, column: 25, scope: !128)
!130 = !DILocation(line: 86, column: 8, scope: !116)
!131 = !DILocation(line: 89, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !16, line: 87, column: 5)
!133 = !DILocation(line: 89, column: 14, scope: !132)
!134 = !DILocation(line: 90, column: 5, scope: !132)
!135 = !DILocalVariable(name: "source", scope: !136, file: !16, line: 92, type: !40)
!136 = distinct !DILexicalBlock(scope: !116, file: !16, line: 91, column: 5)
!137 = !DILocation(line: 92, column: 17, scope: !136)
!138 = !DILocation(line: 93, column: 17, scope: !136)
!139 = !DILocation(line: 93, column: 9, scope: !136)
!140 = !DILocation(line: 94, column: 9, scope: !136)
!141 = !DILocation(line: 94, column: 23, scope: !136)
!142 = !DILocation(line: 96, column: 17, scope: !136)
!143 = !DILocation(line: 96, column: 23, scope: !136)
!144 = !DILocation(line: 96, column: 9, scope: !136)
!145 = !DILocation(line: 98, column: 9, scope: !136)
!146 = !DILocation(line: 98, column: 21, scope: !136)
!147 = !DILocation(line: 99, column: 20, scope: !136)
!148 = !DILocation(line: 99, column: 9, scope: !136)
!149 = !DILocation(line: 101, column: 1, scope: !116)
