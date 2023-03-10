; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end4, !dbg !26

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !32
  store i32* %1, i32** %dataBuffer, align 8, !dbg !30
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !33
  %cmp1 = icmp eq i32* %2, null, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !36

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !40
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !43
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !44
  store i32* %add.ptr, i32** %data, align 8, !dbg !45
  br label %if.end4, !dbg !46

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !54
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx6, align 4, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !58
  %call8 = call i32* @wcsncpy(i32* %6, i32* %arraydecay7, i64 99) #5, !dbg !59
  %7 = load i32*, i32** %data, align 8, !dbg !60
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !60
  store i32 0, i32* %arrayidx9, align 4, !dbg !61
  %8 = load i32*, i32** %data, align 8, !dbg !62
  call void @printWLine(i32* %8), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13_good() #0 !dbg !65 {
entry:
  call void @goodG2B1(), !dbg !66
  call void @goodG2B2(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #5, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #5, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32* null, i32** %data, align 8, !dbg !92
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !93
  %cmp = icmp ne i32 %0, 5, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end4, !dbg !99

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !104
  %1 = bitcast i8* %call to i32*, !dbg !105
  store i32* %1, i32** %dataBuffer, align 8, !dbg !103
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %cmp1 = icmp eq i32* %2, null, !dbg !108
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !109

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !113
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  store i32* %5, i32** %data, align 8, !dbg !117
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !122
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx6, align 4, !dbg !124
  %6 = load i32*, i32** %data, align 8, !dbg !125
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !126
  %call8 = call i32* @wcsncpy(i32* %6, i32* %arraydecay7, i64 99) #5, !dbg !127
  %7 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !128
  store i32 0, i32* %arrayidx9, align 4, !dbg !129
  %8 = load i32*, i32** %data, align 8, !dbg !130
  call void @printWLine(i32* %8), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !134, metadata !DIExpression()), !dbg !135
  store i32* null, i32** %data, align 8, !dbg !136
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !137
  %cmp = icmp eq i32 %0, 5, !dbg !139
  br i1 %cmp, label %if.then, label %if.end4, !dbg !140

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !141, metadata !DIExpression()), !dbg !144
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !145
  %1 = bitcast i8* %call to i32*, !dbg !146
  store i32* %1, i32** %dataBuffer, align 8, !dbg !144
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !147
  %cmp1 = icmp eq i32* %2, null, !dbg !149
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !150

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !153
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !154
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !155
  store i32 0, i32* %arrayidx, align 4, !dbg !156
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !157
  store i32* %5, i32** %data, align 8, !dbg !158
  br label %if.end4, !dbg !159

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !160, metadata !DIExpression()), !dbg !162
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !163
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !164
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx6, align 4, !dbg !166
  %6 = load i32*, i32** %data, align 8, !dbg !167
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !168
  %call8 = call i32* @wcsncpy(i32* %6, i32* %arraydecay7, i64 99) #5, !dbg !169
  %7 = load i32*, i32** %data, align 8, !dbg !170
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !170
  store i32 0, i32* %arrayidx9, align 4, !dbg !171
  %8 = load i32*, i32** %data, align 8, !dbg !172
  call void @printWLine(i32* %8), !dbg !173
  ret void, !dbg !174
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 25, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocalVariable(name: "dataBuffer", scope: !28, file: !17, line: 30, type: !4)
!28 = distinct !DILexicalBlock(scope: !29, file: !17, line: 29, column: 9)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!30 = !DILocation(line: 30, column: 23, scope: !28)
!31 = !DILocation(line: 30, column: 47, scope: !28)
!32 = !DILocation(line: 30, column: 36, scope: !28)
!33 = !DILocation(line: 31, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 17)
!35 = !DILocation(line: 31, column: 28, scope: !34)
!36 = !DILocation(line: 31, column: 17, scope: !28)
!37 = !DILocation(line: 31, column: 38, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 31, column: 37)
!39 = !DILocation(line: 32, column: 21, scope: !28)
!40 = !DILocation(line: 32, column: 13, scope: !28)
!41 = !DILocation(line: 33, column: 13, scope: !28)
!42 = !DILocation(line: 33, column: 31, scope: !28)
!43 = !DILocation(line: 35, column: 20, scope: !28)
!44 = !DILocation(line: 35, column: 31, scope: !28)
!45 = !DILocation(line: 35, column: 18, scope: !28)
!46 = !DILocation(line: 37, column: 5, scope: !29)
!47 = !DILocalVariable(name: "source", scope: !48, file: !17, line: 39, type: !49)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 39, column: 17, scope: !48)
!53 = !DILocation(line: 40, column: 17, scope: !48)
!54 = !DILocation(line: 40, column: 9, scope: !48)
!55 = !DILocation(line: 41, column: 9, scope: !48)
!56 = !DILocation(line: 41, column: 23, scope: !48)
!57 = !DILocation(line: 43, column: 17, scope: !48)
!58 = !DILocation(line: 43, column: 23, scope: !48)
!59 = !DILocation(line: 43, column: 9, scope: !48)
!60 = !DILocation(line: 45, column: 9, scope: !48)
!61 = !DILocation(line: 45, column: 21, scope: !48)
!62 = !DILocation(line: 46, column: 20, scope: !48)
!63 = !DILocation(line: 46, column: 9, scope: !48)
!64 = !DILocation(line: 50, column: 1, scope: !16)
!65 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_ncpy_13_good", scope: !17, file: !17, line: 121, type: !18, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 123, column: 5, scope: !65)
!67 = !DILocation(line: 124, column: 5, scope: !65)
!68 = !DILocation(line: 125, column: 1, scope: !65)
!69 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 137, type: !70, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!7, !7, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !17, line: 137, type: !7)
!76 = !DILocation(line: 137, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !17, line: 137, type: !72)
!78 = !DILocation(line: 137, column: 27, scope: !69)
!79 = !DILocation(line: 140, column: 22, scope: !69)
!80 = !DILocation(line: 140, column: 12, scope: !69)
!81 = !DILocation(line: 140, column: 5, scope: !69)
!82 = !DILocation(line: 142, column: 5, scope: !69)
!83 = !DILocation(line: 143, column: 5, scope: !69)
!84 = !DILocation(line: 144, column: 5, scope: !69)
!85 = !DILocation(line: 147, column: 5, scope: !69)
!86 = !DILocation(line: 148, column: 5, scope: !69)
!87 = !DILocation(line: 149, column: 5, scope: !69)
!88 = !DILocation(line: 151, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !17, line: 59, type: !4)
!91 = !DILocation(line: 59, column: 15, scope: !89)
!92 = !DILocation(line: 60, column: 10, scope: !89)
!93 = !DILocation(line: 61, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !89, file: !17, line: 61, column: 8)
!95 = !DILocation(line: 61, column: 25, scope: !94)
!96 = !DILocation(line: 61, column: 8, scope: !89)
!97 = !DILocation(line: 64, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !17, line: 62, column: 5)
!99 = !DILocation(line: 65, column: 5, scope: !98)
!100 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !17, line: 69, type: !4)
!101 = distinct !DILexicalBlock(scope: !102, file: !17, line: 68, column: 9)
!102 = distinct !DILexicalBlock(scope: !94, file: !17, line: 67, column: 5)
!103 = !DILocation(line: 69, column: 23, scope: !101)
!104 = !DILocation(line: 69, column: 47, scope: !101)
!105 = !DILocation(line: 69, column: 36, scope: !101)
!106 = !DILocation(line: 70, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !17, line: 70, column: 17)
!108 = !DILocation(line: 70, column: 28, scope: !107)
!109 = !DILocation(line: 70, column: 17, scope: !101)
!110 = !DILocation(line: 70, column: 38, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !17, line: 70, column: 37)
!112 = !DILocation(line: 71, column: 21, scope: !101)
!113 = !DILocation(line: 71, column: 13, scope: !101)
!114 = !DILocation(line: 72, column: 13, scope: !101)
!115 = !DILocation(line: 72, column: 31, scope: !101)
!116 = !DILocation(line: 74, column: 20, scope: !101)
!117 = !DILocation(line: 74, column: 18, scope: !101)
!118 = !DILocalVariable(name: "source", scope: !119, file: !17, line: 78, type: !49)
!119 = distinct !DILexicalBlock(scope: !89, file: !17, line: 77, column: 5)
!120 = !DILocation(line: 78, column: 17, scope: !119)
!121 = !DILocation(line: 79, column: 17, scope: !119)
!122 = !DILocation(line: 79, column: 9, scope: !119)
!123 = !DILocation(line: 80, column: 9, scope: !119)
!124 = !DILocation(line: 80, column: 23, scope: !119)
!125 = !DILocation(line: 82, column: 17, scope: !119)
!126 = !DILocation(line: 82, column: 23, scope: !119)
!127 = !DILocation(line: 82, column: 9, scope: !119)
!128 = !DILocation(line: 84, column: 9, scope: !119)
!129 = !DILocation(line: 84, column: 21, scope: !119)
!130 = !DILocation(line: 85, column: 20, scope: !119)
!131 = !DILocation(line: 85, column: 9, scope: !119)
!132 = !DILocation(line: 89, column: 1, scope: !89)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !17, line: 94, type: !4)
!135 = !DILocation(line: 94, column: 15, scope: !133)
!136 = !DILocation(line: 95, column: 10, scope: !133)
!137 = !DILocation(line: 96, column: 8, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !17, line: 96, column: 8)
!139 = !DILocation(line: 96, column: 25, scope: !138)
!140 = !DILocation(line: 96, column: 8, scope: !133)
!141 = !DILocalVariable(name: "dataBuffer", scope: !142, file: !17, line: 99, type: !4)
!142 = distinct !DILexicalBlock(scope: !143, file: !17, line: 98, column: 9)
!143 = distinct !DILexicalBlock(scope: !138, file: !17, line: 97, column: 5)
!144 = !DILocation(line: 99, column: 23, scope: !142)
!145 = !DILocation(line: 99, column: 47, scope: !142)
!146 = !DILocation(line: 99, column: 36, scope: !142)
!147 = !DILocation(line: 100, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !17, line: 100, column: 17)
!149 = !DILocation(line: 100, column: 28, scope: !148)
!150 = !DILocation(line: 100, column: 17, scope: !142)
!151 = !DILocation(line: 100, column: 38, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !17, line: 100, column: 37)
!153 = !DILocation(line: 101, column: 21, scope: !142)
!154 = !DILocation(line: 101, column: 13, scope: !142)
!155 = !DILocation(line: 102, column: 13, scope: !142)
!156 = !DILocation(line: 102, column: 31, scope: !142)
!157 = !DILocation(line: 104, column: 20, scope: !142)
!158 = !DILocation(line: 104, column: 18, scope: !142)
!159 = !DILocation(line: 106, column: 5, scope: !143)
!160 = !DILocalVariable(name: "source", scope: !161, file: !17, line: 108, type: !49)
!161 = distinct !DILexicalBlock(scope: !133, file: !17, line: 107, column: 5)
!162 = !DILocation(line: 108, column: 17, scope: !161)
!163 = !DILocation(line: 109, column: 17, scope: !161)
!164 = !DILocation(line: 109, column: 9, scope: !161)
!165 = !DILocation(line: 110, column: 9, scope: !161)
!166 = !DILocation(line: 110, column: 23, scope: !161)
!167 = !DILocation(line: 112, column: 17, scope: !161)
!168 = !DILocation(line: 112, column: 23, scope: !161)
!169 = !DILocation(line: 112, column: 9, scope: !161)
!170 = !DILocation(line: 114, column: 9, scope: !161)
!171 = !DILocation(line: 114, column: 21, scope: !161)
!172 = !DILocation(line: 115, column: 20, scope: !161)
!173 = !DILocation(line: 115, column: 9, scope: !161)
!174 = !DILocation(line: 119, column: 1, scope: !133)
