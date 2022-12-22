; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx1, align 4, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call3 = call i32* @wcscat(i32* %7, i32* %arraydecay2) #4, !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  call void @printWLine(i32* %8), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #4, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #4, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 200, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !88
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %2 = alloca i8, i64 400, align 16, !dbg !91
  %3 = bitcast i8* %2 to i32*, !dbg !92
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !90
  %4 = load i32, i32* @staticFive, align 4, !dbg !93
  %cmp = icmp ne i32 %4, 5, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end, !dbg !99

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !100
  store i32* %5, i32** %data, align 8, !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !109
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx1, align 4, !dbg !111
  %7 = load i32*, i32** %data, align 8, !dbg !112
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %call3 = call i32* @wcscat(i32* %7, i32* %arraydecay2) #4, !dbg !114
  %8 = load i32*, i32** %data, align 8, !dbg !115
  call void @printWLine(i32* %8), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = alloca i8, i64 200, align 16, !dbg !123
  %1 = bitcast i8* %0 to i32*, !dbg !124
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %2 = alloca i8, i64 400, align 16, !dbg !127
  %3 = bitcast i8* %2 to i32*, !dbg !128
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !126
  %4 = load i32, i32* @staticFive, align 4, !dbg !129
  %cmp = icmp eq i32 %4, 5, !dbg !131
  br i1 %cmp, label %if.then, label %if.end, !dbg !132

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !133
  store i32* %5, i32** %data, align 8, !dbg !135
  %6 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  br label %if.end, !dbg !138

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !139, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !142
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !143
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx1, align 4, !dbg !145
  %7 = load i32*, i32** %data, align 8, !dbg !146
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !147
  %call3 = call i32* @wcscat(i32* %7, i32* %arraydecay2) #4, !dbg !148
  %8 = load i32*, i32** %data, align 8, !dbg !149
  call void @printWLine(i32* %8), !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !12, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0}
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 15, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 15, scope: !19)
!26 = !DILocation(line: 32, column: 42, scope: !19)
!27 = !DILocation(line: 32, column: 31, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 33, type: !6)
!29 = !DILocation(line: 33, column: 15, scope: !19)
!30 = !DILocation(line: 33, column: 43, scope: !19)
!31 = !DILocation(line: 33, column: 32, scope: !19)
!32 = !DILocation(line: 34, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 34, column: 8)
!34 = !DILocation(line: 34, column: 18, scope: !33)
!35 = !DILocation(line: 34, column: 8, scope: !19)
!36 = !DILocation(line: 38, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !12, line: 35, column: 5)
!38 = !DILocation(line: 38, column: 14, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 17, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !12, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 42, column: 17, scope: !43)
!48 = !DILocation(line: 43, column: 17, scope: !43)
!49 = !DILocation(line: 43, column: 9, scope: !43)
!50 = !DILocation(line: 44, column: 9, scope: !43)
!51 = !DILocation(line: 44, column: 23, scope: !43)
!52 = !DILocation(line: 46, column: 16, scope: !43)
!53 = !DILocation(line: 46, column: 22, scope: !43)
!54 = !DILocation(line: 46, column: 9, scope: !43)
!55 = !DILocation(line: 47, column: 20, scope: !43)
!56 = !DILocation(line: 47, column: 9, scope: !43)
!57 = !DILocation(line: 49, column: 1, scope: !19)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_07_good", scope: !12, file: !12, line: 104, type: !20, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DILocation(line: 106, column: 5, scope: !58)
!60 = !DILocation(line: 107, column: 5, scope: !58)
!61 = !DILocation(line: 108, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 120, type: !63, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!63 = !DISubroutineType(types: !64)
!64 = !{!9, !9, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 120, type: !9)
!69 = !DILocation(line: 120, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 120, type: !65)
!71 = !DILocation(line: 120, column: 27, scope: !62)
!72 = !DILocation(line: 123, column: 22, scope: !62)
!73 = !DILocation(line: 123, column: 12, scope: !62)
!74 = !DILocation(line: 123, column: 5, scope: !62)
!75 = !DILocation(line: 125, column: 5, scope: !62)
!76 = !DILocation(line: 126, column: 5, scope: !62)
!77 = !DILocation(line: 127, column: 5, scope: !62)
!78 = !DILocation(line: 130, column: 5, scope: !62)
!79 = !DILocation(line: 131, column: 5, scope: !62)
!80 = !DILocation(line: 132, column: 5, scope: !62)
!81 = !DILocation(line: 134, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 58, type: !6)
!84 = !DILocation(line: 58, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 59, type: !6)
!86 = !DILocation(line: 59, column: 15, scope: !82)
!87 = !DILocation(line: 59, column: 42, scope: !82)
!88 = !DILocation(line: 59, column: 31, scope: !82)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 60, type: !6)
!90 = !DILocation(line: 60, column: 15, scope: !82)
!91 = !DILocation(line: 60, column: 43, scope: !82)
!92 = !DILocation(line: 60, column: 32, scope: !82)
!93 = !DILocation(line: 61, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !12, line: 61, column: 8)
!95 = !DILocation(line: 61, column: 18, scope: !94)
!96 = !DILocation(line: 61, column: 8, scope: !82)
!97 = !DILocation(line: 64, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !12, line: 62, column: 5)
!99 = !DILocation(line: 65, column: 5, scope: !98)
!100 = !DILocation(line: 69, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !12, line: 67, column: 5)
!102 = !DILocation(line: 69, column: 14, scope: !101)
!103 = !DILocation(line: 70, column: 9, scope: !101)
!104 = !DILocation(line: 70, column: 17, scope: !101)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 73, type: !44)
!106 = distinct !DILexicalBlock(scope: !82, file: !12, line: 72, column: 5)
!107 = !DILocation(line: 73, column: 17, scope: !106)
!108 = !DILocation(line: 74, column: 17, scope: !106)
!109 = !DILocation(line: 74, column: 9, scope: !106)
!110 = !DILocation(line: 75, column: 9, scope: !106)
!111 = !DILocation(line: 75, column: 23, scope: !106)
!112 = !DILocation(line: 77, column: 16, scope: !106)
!113 = !DILocation(line: 77, column: 22, scope: !106)
!114 = !DILocation(line: 77, column: 9, scope: !106)
!115 = !DILocation(line: 78, column: 20, scope: !106)
!116 = !DILocation(line: 78, column: 9, scope: !106)
!117 = !DILocation(line: 80, column: 1, scope: !82)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !12, line: 85, type: !6)
!120 = !DILocation(line: 85, column: 15, scope: !118)
!121 = !DILocalVariable(name: "dataBadBuffer", scope: !118, file: !12, line: 86, type: !6)
!122 = !DILocation(line: 86, column: 15, scope: !118)
!123 = !DILocation(line: 86, column: 42, scope: !118)
!124 = !DILocation(line: 86, column: 31, scope: !118)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !118, file: !12, line: 87, type: !6)
!126 = !DILocation(line: 87, column: 15, scope: !118)
!127 = !DILocation(line: 87, column: 43, scope: !118)
!128 = !DILocation(line: 87, column: 32, scope: !118)
!129 = !DILocation(line: 88, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !118, file: !12, line: 88, column: 8)
!131 = !DILocation(line: 88, column: 18, scope: !130)
!132 = !DILocation(line: 88, column: 8, scope: !118)
!133 = !DILocation(line: 91, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 89, column: 5)
!135 = !DILocation(line: 91, column: 14, scope: !134)
!136 = !DILocation(line: 92, column: 9, scope: !134)
!137 = !DILocation(line: 92, column: 17, scope: !134)
!138 = !DILocation(line: 93, column: 5, scope: !134)
!139 = !DILocalVariable(name: "source", scope: !140, file: !12, line: 95, type: !44)
!140 = distinct !DILexicalBlock(scope: !118, file: !12, line: 94, column: 5)
!141 = !DILocation(line: 95, column: 17, scope: !140)
!142 = !DILocation(line: 96, column: 17, scope: !140)
!143 = !DILocation(line: 96, column: 9, scope: !140)
!144 = !DILocation(line: 97, column: 9, scope: !140)
!145 = !DILocation(line: 97, column: 23, scope: !140)
!146 = !DILocation(line: 99, column: 16, scope: !140)
!147 = !DILocation(line: 99, column: 22, scope: !140)
!148 = !DILocation(line: 99, column: 9, scope: !140)
!149 = !DILocation(line: 100, column: 20, scope: !140)
!150 = !DILocation(line: 100, column: 9, scope: !140)
!151 = !DILocation(line: 102, column: 1, scope: !118)
