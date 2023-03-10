; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11_bad() #0 !dbg !15 {
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
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call1, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !34
  store i32* %add.ptr, i32** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #4, !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !50
  store i32 0, i32* %arrayidx6, align 4, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* %7), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrue(...) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11_good() #0 !dbg !55 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
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
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !87
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !90
  %tobool = icmp ne i32 %call1, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !96
  store i32* %4, i32** %data, align 8, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx3, align 4, !dbg !105
  %5 = load i32*, i32** %data, align 8, !dbg !106
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #4, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !109
  store i32 0, i32* %arrayidx6, align 4, !dbg !110
  %7 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %7), !dbg !112
  ret void, !dbg !113
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 400, align 16, !dbg !119
  %1 = bitcast i8* %0 to i32*, !dbg !120
  store i32* %1, i32** %dataBuffer, align 8, !dbg !118
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !121
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !122
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !125
  %tobool = icmp ne i32 %call1, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  store i32* %4, i32** %data, align 8, !dbg !130
  br label %if.end, !dbg !131

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !132, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !135
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !136
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx3, align 4, !dbg !138
  %5 = load i32*, i32** %data, align 8, !dbg !139
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !140
  %call5 = call i32* @wcsncpy(i32* %5, i32* %arraydecay4, i64 99) #4, !dbg !141
  %6 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx6 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !142
  store i32 0, i32* %arrayidx6, align 4, !dbg !143
  %7 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %7), !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!31 = !DILocation(line: 29, column: 8, scope: !15)
!32 = !DILocation(line: 32, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 30, column: 5)
!34 = !DILocation(line: 32, column: 27, scope: !33)
!35 = !DILocation(line: 32, column: 14, scope: !33)
!36 = !DILocation(line: 33, column: 5, scope: !33)
!37 = !DILocalVariable(name: "source", scope: !38, file: !16, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 35, column: 17, scope: !38)
!43 = !DILocation(line: 36, column: 17, scope: !38)
!44 = !DILocation(line: 36, column: 9, scope: !38)
!45 = !DILocation(line: 37, column: 9, scope: !38)
!46 = !DILocation(line: 37, column: 23, scope: !38)
!47 = !DILocation(line: 39, column: 17, scope: !38)
!48 = !DILocation(line: 39, column: 23, scope: !38)
!49 = !DILocation(line: 39, column: 9, scope: !38)
!50 = !DILocation(line: 41, column: 9, scope: !38)
!51 = !DILocation(line: 41, column: 21, scope: !38)
!52 = !DILocation(line: 42, column: 20, scope: !38)
!53 = !DILocation(line: 42, column: 9, scope: !38)
!54 = !DILocation(line: 44, column: 1, scope: !15)
!55 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_alloca_ncpy_11_good", scope: !16, file: !16, line: 103, type: !17, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 105, column: 5, scope: !55)
!57 = !DILocation(line: 106, column: 5, scope: !55)
!58 = !DILocation(line: 107, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 119, type: !60, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!7, !7, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !16, line: 119, type: !7)
!66 = !DILocation(line: 119, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !16, line: 119, type: !62)
!68 = !DILocation(line: 119, column: 27, scope: !59)
!69 = !DILocation(line: 122, column: 22, scope: !59)
!70 = !DILocation(line: 122, column: 12, scope: !59)
!71 = !DILocation(line: 122, column: 5, scope: !59)
!72 = !DILocation(line: 124, column: 5, scope: !59)
!73 = !DILocation(line: 125, column: 5, scope: !59)
!74 = !DILocation(line: 126, column: 5, scope: !59)
!75 = !DILocation(line: 129, column: 5, scope: !59)
!76 = !DILocation(line: 130, column: 5, scope: !59)
!77 = !DILocation(line: 131, column: 5, scope: !59)
!78 = !DILocation(line: 133, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !16, line: 53, type: !4)
!81 = !DILocation(line: 53, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !16, line: 54, type: !4)
!83 = !DILocation(line: 54, column: 15, scope: !79)
!84 = !DILocation(line: 54, column: 39, scope: !79)
!85 = !DILocation(line: 54, column: 28, scope: !79)
!86 = !DILocation(line: 55, column: 13, scope: !79)
!87 = !DILocation(line: 55, column: 5, scope: !79)
!88 = !DILocation(line: 56, column: 5, scope: !79)
!89 = !DILocation(line: 56, column: 23, scope: !79)
!90 = !DILocation(line: 57, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !16, line: 57, column: 8)
!92 = !DILocation(line: 57, column: 8, scope: !79)
!93 = !DILocation(line: 60, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !16, line: 58, column: 5)
!95 = !DILocation(line: 61, column: 5, scope: !94)
!96 = !DILocation(line: 65, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !16, line: 63, column: 5)
!98 = !DILocation(line: 65, column: 14, scope: !97)
!99 = !DILocalVariable(name: "source", scope: !100, file: !16, line: 68, type: !39)
!100 = distinct !DILexicalBlock(scope: !79, file: !16, line: 67, column: 5)
!101 = !DILocation(line: 68, column: 17, scope: !100)
!102 = !DILocation(line: 69, column: 17, scope: !100)
!103 = !DILocation(line: 69, column: 9, scope: !100)
!104 = !DILocation(line: 70, column: 9, scope: !100)
!105 = !DILocation(line: 70, column: 23, scope: !100)
!106 = !DILocation(line: 72, column: 17, scope: !100)
!107 = !DILocation(line: 72, column: 23, scope: !100)
!108 = !DILocation(line: 72, column: 9, scope: !100)
!109 = !DILocation(line: 74, column: 9, scope: !100)
!110 = !DILocation(line: 74, column: 21, scope: !100)
!111 = !DILocation(line: 75, column: 20, scope: !100)
!112 = !DILocation(line: 75, column: 9, scope: !100)
!113 = !DILocation(line: 77, column: 1, scope: !79)
!114 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !16, line: 82, type: !4)
!116 = !DILocation(line: 82, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !16, line: 83, type: !4)
!118 = !DILocation(line: 83, column: 15, scope: !114)
!119 = !DILocation(line: 83, column: 39, scope: !114)
!120 = !DILocation(line: 83, column: 28, scope: !114)
!121 = !DILocation(line: 84, column: 13, scope: !114)
!122 = !DILocation(line: 84, column: 5, scope: !114)
!123 = !DILocation(line: 85, column: 5, scope: !114)
!124 = !DILocation(line: 85, column: 23, scope: !114)
!125 = !DILocation(line: 86, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !114, file: !16, line: 86, column: 8)
!127 = !DILocation(line: 86, column: 8, scope: !114)
!128 = !DILocation(line: 89, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !16, line: 87, column: 5)
!130 = !DILocation(line: 89, column: 14, scope: !129)
!131 = !DILocation(line: 90, column: 5, scope: !129)
!132 = !DILocalVariable(name: "source", scope: !133, file: !16, line: 92, type: !39)
!133 = distinct !DILexicalBlock(scope: !114, file: !16, line: 91, column: 5)
!134 = !DILocation(line: 92, column: 17, scope: !133)
!135 = !DILocation(line: 93, column: 17, scope: !133)
!136 = !DILocation(line: 93, column: 9, scope: !133)
!137 = !DILocation(line: 94, column: 9, scope: !133)
!138 = !DILocation(line: 94, column: 23, scope: !133)
!139 = !DILocation(line: 96, column: 17, scope: !133)
!140 = !DILocation(line: 96, column: 23, scope: !133)
!141 = !DILocation(line: 96, column: 9, scope: !133)
!142 = !DILocation(line: 98, column: 9, scope: !133)
!143 = !DILocation(line: 98, column: 21, scope: !133)
!144 = !DILocation(line: 99, column: 20, scope: !133)
!145 = !DILocation(line: 99, column: 9, scope: !133)
!146 = !DILocation(line: 101, column: 1, scope: !114)
