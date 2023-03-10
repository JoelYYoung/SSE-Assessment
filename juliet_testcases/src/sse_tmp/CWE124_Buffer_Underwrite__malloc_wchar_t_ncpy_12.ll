; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataBuffer4 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !30
  %0 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %0, i32** %dataBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !39
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end11, !dbg !45

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer4, metadata !46, metadata !DIExpression()), !dbg !49
  %call5 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !50
  %5 = bitcast i8* %call5 to i32*, !dbg !51
  store i32* %5, i32** %dataBuffer4, align 8, !dbg !49
  %6 = load i32*, i32** %dataBuffer4, align 8, !dbg !52
  %cmp6 = icmp eq i32* %6, null, !dbg !54
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !55

if.then7:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !56
  unreachable, !dbg !56

if.end8:                                          ; preds = %if.else
  %7 = load i32*, i32** %dataBuffer4, align 8, !dbg !58
  %call9 = call i32* @wmemset(i32* %7, i32 65, i64 99) #5, !dbg !59
  %8 = load i32*, i32** %dataBuffer4, align 8, !dbg !60
  %arrayidx10 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !60
  store i32 0, i32* %arrayidx10, align 4, !dbg !61
  %9 = load i32*, i32** %dataBuffer4, align 8, !dbg !62
  store i32* %9, i32** %data, align 8, !dbg !63
  br label %if.end11

if.end11:                                         ; preds = %if.end8, %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !64, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !70
  %call12 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !71
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !72
  store i32 0, i32* %arrayidx13, align 4, !dbg !73
  %10 = load i32*, i32** %data, align 8, !dbg !74
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !75
  %call15 = call i32* @wcsncpy(i32* %10, i32* %arraydecay14, i64 99) #5, !dbg !76
  %11 = load i32*, i32** %data, align 8, !dbg !77
  %arrayidx16 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !77
  store i32 0, i32* %arrayidx16, align 4, !dbg !78
  %12 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %12), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataBuffer4 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %data, align 8, !dbg !108
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !115
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !116
  %0 = bitcast i8* %call1 to i32*, !dbg !117
  store i32* %0, i32** %dataBuffer, align 8, !dbg !115
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then2, label %if.end, !dbg !121

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !125
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !128
  store i32* %4, i32** %data, align 8, !dbg !129
  br label %if.end11, !dbg !130

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer4, metadata !131, metadata !DIExpression()), !dbg !134
  %call5 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !135
  %5 = bitcast i8* %call5 to i32*, !dbg !136
  store i32* %5, i32** %dataBuffer4, align 8, !dbg !134
  %6 = load i32*, i32** %dataBuffer4, align 8, !dbg !137
  %cmp6 = icmp eq i32* %6, null, !dbg !139
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !140

if.then7:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !141
  unreachable, !dbg !141

if.end8:                                          ; preds = %if.else
  %7 = load i32*, i32** %dataBuffer4, align 8, !dbg !143
  %call9 = call i32* @wmemset(i32* %7, i32 65, i64 99) #5, !dbg !144
  %8 = load i32*, i32** %dataBuffer4, align 8, !dbg !145
  %arrayidx10 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !145
  store i32 0, i32* %arrayidx10, align 4, !dbg !146
  %9 = load i32*, i32** %dataBuffer4, align 8, !dbg !147
  store i32* %9, i32** %data, align 8, !dbg !148
  br label %if.end11

if.end11:                                         ; preds = %if.end8, %if.end
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !149, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !152
  %call12 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !153
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx13, align 4, !dbg !155
  %10 = load i32*, i32** %data, align 8, !dbg !156
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !157
  %call15 = call i32* @wcsncpy(i32* %10, i32* %arraydecay14, i64 99) #5, !dbg !158
  %11 = load i32*, i32** %data, align 8, !dbg !159
  %arrayidx16 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !159
  store i32 0, i32* %arrayidx16, align 4, !dbg !160
  %12 = load i32*, i32** %data, align 8, !dbg !161
  call void @printWLine(i32* %12), !dbg !162
  ret void, !dbg !163
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !17, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !28, file: !17, line: 29, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 23, scope: !27)
!30 = !DILocation(line: 30, column: 47, scope: !27)
!31 = !DILocation(line: 30, column: 36, scope: !27)
!32 = !DILocation(line: 31, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 17)
!34 = !DILocation(line: 31, column: 28, scope: !33)
!35 = !DILocation(line: 31, column: 17, scope: !27)
!36 = !DILocation(line: 31, column: 38, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 31, column: 37)
!38 = !DILocation(line: 32, column: 21, scope: !27)
!39 = !DILocation(line: 32, column: 13, scope: !27)
!40 = !DILocation(line: 33, column: 13, scope: !27)
!41 = !DILocation(line: 33, column: 31, scope: !27)
!42 = !DILocation(line: 35, column: 20, scope: !27)
!43 = !DILocation(line: 35, column: 31, scope: !27)
!44 = !DILocation(line: 35, column: 18, scope: !27)
!45 = !DILocation(line: 37, column: 5, scope: !28)
!46 = !DILocalVariable(name: "dataBuffer", scope: !47, file: !17, line: 41, type: !4)
!47 = distinct !DILexicalBlock(scope: !48, file: !17, line: 40, column: 9)
!48 = distinct !DILexicalBlock(scope: !24, file: !17, line: 39, column: 5)
!49 = !DILocation(line: 41, column: 23, scope: !47)
!50 = !DILocation(line: 41, column: 47, scope: !47)
!51 = !DILocation(line: 41, column: 36, scope: !47)
!52 = !DILocation(line: 42, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !17, line: 42, column: 17)
!54 = !DILocation(line: 42, column: 28, scope: !53)
!55 = !DILocation(line: 42, column: 17, scope: !47)
!56 = !DILocation(line: 42, column: 38, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !17, line: 42, column: 37)
!58 = !DILocation(line: 43, column: 21, scope: !47)
!59 = !DILocation(line: 43, column: 13, scope: !47)
!60 = !DILocation(line: 44, column: 13, scope: !47)
!61 = !DILocation(line: 44, column: 31, scope: !47)
!62 = !DILocation(line: 46, column: 20, scope: !47)
!63 = !DILocation(line: 46, column: 18, scope: !47)
!64 = !DILocalVariable(name: "source", scope: !65, file: !17, line: 50, type: !66)
!65 = distinct !DILexicalBlock(scope: !16, file: !17, line: 49, column: 5)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 100)
!69 = !DILocation(line: 50, column: 17, scope: !65)
!70 = !DILocation(line: 51, column: 17, scope: !65)
!71 = !DILocation(line: 51, column: 9, scope: !65)
!72 = !DILocation(line: 52, column: 9, scope: !65)
!73 = !DILocation(line: 52, column: 23, scope: !65)
!74 = !DILocation(line: 54, column: 17, scope: !65)
!75 = !DILocation(line: 54, column: 23, scope: !65)
!76 = !DILocation(line: 54, column: 9, scope: !65)
!77 = !DILocation(line: 56, column: 9, scope: !65)
!78 = !DILocation(line: 56, column: 21, scope: !65)
!79 = !DILocation(line: 57, column: 20, scope: !65)
!80 = !DILocation(line: 57, column: 9, scope: !65)
!81 = !DILocation(line: 61, column: 1, scope: !16)
!82 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_12_good", scope: !17, file: !17, line: 109, type: !18, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 111, column: 5, scope: !82)
!84 = !DILocation(line: 112, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 124, type: !86, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!7, !7, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !17, line: 124, type: !7)
!92 = !DILocation(line: 124, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !17, line: 124, type: !88)
!94 = !DILocation(line: 124, column: 27, scope: !85)
!95 = !DILocation(line: 127, column: 22, scope: !85)
!96 = !DILocation(line: 127, column: 12, scope: !85)
!97 = !DILocation(line: 127, column: 5, scope: !85)
!98 = !DILocation(line: 129, column: 5, scope: !85)
!99 = !DILocation(line: 130, column: 5, scope: !85)
!100 = !DILocation(line: 131, column: 5, scope: !85)
!101 = !DILocation(line: 134, column: 5, scope: !85)
!102 = !DILocation(line: 135, column: 5, scope: !85)
!103 = !DILocation(line: 136, column: 5, scope: !85)
!104 = !DILocation(line: 138, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 69, type: !18, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 71, type: !4)
!107 = !DILocation(line: 71, column: 15, scope: !105)
!108 = !DILocation(line: 72, column: 10, scope: !105)
!109 = !DILocation(line: 73, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !17, line: 73, column: 8)
!111 = !DILocation(line: 73, column: 8, scope: !105)
!112 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !17, line: 76, type: !4)
!113 = distinct !DILexicalBlock(scope: !114, file: !17, line: 75, column: 9)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 74, column: 5)
!115 = !DILocation(line: 76, column: 23, scope: !113)
!116 = !DILocation(line: 76, column: 47, scope: !113)
!117 = !DILocation(line: 76, column: 36, scope: !113)
!118 = !DILocation(line: 77, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !17, line: 77, column: 17)
!120 = !DILocation(line: 77, column: 28, scope: !119)
!121 = !DILocation(line: 77, column: 17, scope: !113)
!122 = !DILocation(line: 77, column: 38, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 77, column: 37)
!124 = !DILocation(line: 78, column: 21, scope: !113)
!125 = !DILocation(line: 78, column: 13, scope: !113)
!126 = !DILocation(line: 79, column: 13, scope: !113)
!127 = !DILocation(line: 79, column: 31, scope: !113)
!128 = !DILocation(line: 81, column: 20, scope: !113)
!129 = !DILocation(line: 81, column: 18, scope: !113)
!130 = !DILocation(line: 83, column: 5, scope: !114)
!131 = !DILocalVariable(name: "dataBuffer", scope: !132, file: !17, line: 87, type: !4)
!132 = distinct !DILexicalBlock(scope: !133, file: !17, line: 86, column: 9)
!133 = distinct !DILexicalBlock(scope: !110, file: !17, line: 85, column: 5)
!134 = !DILocation(line: 87, column: 23, scope: !132)
!135 = !DILocation(line: 87, column: 47, scope: !132)
!136 = !DILocation(line: 87, column: 36, scope: !132)
!137 = !DILocation(line: 88, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !17, line: 88, column: 17)
!139 = !DILocation(line: 88, column: 28, scope: !138)
!140 = !DILocation(line: 88, column: 17, scope: !132)
!141 = !DILocation(line: 88, column: 38, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !17, line: 88, column: 37)
!143 = !DILocation(line: 89, column: 21, scope: !132)
!144 = !DILocation(line: 89, column: 13, scope: !132)
!145 = !DILocation(line: 90, column: 13, scope: !132)
!146 = !DILocation(line: 90, column: 31, scope: !132)
!147 = !DILocation(line: 92, column: 20, scope: !132)
!148 = !DILocation(line: 92, column: 18, scope: !132)
!149 = !DILocalVariable(name: "source", scope: !150, file: !17, line: 96, type: !66)
!150 = distinct !DILexicalBlock(scope: !105, file: !17, line: 95, column: 5)
!151 = !DILocation(line: 96, column: 17, scope: !150)
!152 = !DILocation(line: 97, column: 17, scope: !150)
!153 = !DILocation(line: 97, column: 9, scope: !150)
!154 = !DILocation(line: 98, column: 9, scope: !150)
!155 = !DILocation(line: 98, column: 23, scope: !150)
!156 = !DILocation(line: 100, column: 17, scope: !150)
!157 = !DILocation(line: 100, column: 23, scope: !150)
!158 = !DILocation(line: 100, column: 9, scope: !150)
!159 = !DILocation(line: 102, column: 9, scope: !150)
!160 = !DILocation(line: 102, column: 21, scope: !150)
!161 = !DILocation(line: 103, column: 20, scope: !150)
!162 = !DILocation(line: 103, column: 9, scope: !150)
!163 = !DILocation(line: 107, column: 1, scope: !105)
