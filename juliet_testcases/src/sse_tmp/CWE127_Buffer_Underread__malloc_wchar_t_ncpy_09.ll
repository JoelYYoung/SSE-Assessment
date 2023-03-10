; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09.c"
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
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !30
  %1 = bitcast i8* %call to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %2, null, !dbg !34
  br i1 %cmp, label %if.then1, label %if.end, !dbg !35

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %5, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !53
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx5, align 4, !dbg !55
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !59
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %6, i64 %call8) #6, !dbg !60
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx10, align 4, !dbg !62
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay11), !dbg !64
  ret void, !dbg !65
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
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
  %call = call i64 @time(i64* null) #6, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #6, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i32* null, i32** %data, align 8, !dbg !93
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !94
  %tobool = icmp ne i32 %0, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end3, !dbg !99

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !104
  %1 = bitcast i8* %call to i32*, !dbg !105
  store i32* %1, i32** %dataBuffer, align 8, !dbg !103
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !106
  %cmp = icmp eq i32* %2, null, !dbg !108
  br i1 %cmp, label %if.then1, label %if.end, !dbg !109

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !112
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !113
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  store i32* %5, i32** %data, align 8, !dbg !117
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !118, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !121
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !122
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx5, align 4, !dbg !124
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %6 = load i32*, i32** %data, align 8, !dbg !126
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !128
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %6, i64 %call8) #6, !dbg !129
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx10, align 4, !dbg !131
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  call void @printWLine(i32* %arraydecay11), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i32* null, i32** %data, align 8, !dbg !138
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !139
  %tobool = icmp ne i32 %0, 0, !dbg !139
  br i1 %tobool, label %if.then, label %if.end3, !dbg !141

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !142, metadata !DIExpression()), !dbg !145
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !146
  %1 = bitcast i8* %call to i32*, !dbg !147
  store i32* %1, i32** %dataBuffer, align 8, !dbg !145
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %cmp = icmp eq i32* %2, null, !dbg !150
  br i1 %cmp, label %if.then1, label %if.end, !dbg !151

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !154
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !155
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !158
  store i32* %5, i32** %data, align 8, !dbg !159
  br label %if.end3, !dbg !160

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !161, metadata !DIExpression()), !dbg !163
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !165
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx5, align 4, !dbg !167
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  %6 = load i32*, i32** %data, align 8, !dbg !169
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  %call8 = call i64 @wcslen(i32* %arraydecay7) #8, !dbg !171
  %call9 = call i32* @wcsncpy(i32* %arraydecay6, i32* %6, i64 %call8) #6, !dbg !172
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx10, align 4, !dbg !174
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !175
  call void @printWLine(i32* %arraydecay11), !dbg !176
  ret void, !dbg !177
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09.c", directory: "/home/joelyang/SSE-Assessment")
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
!46 = !DILocalVariable(name: "dest", scope: !47, file: !17, line: 39, type: !48)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 39, column: 17, scope: !47)
!52 = !DILocation(line: 40, column: 17, scope: !47)
!53 = !DILocation(line: 40, column: 9, scope: !47)
!54 = !DILocation(line: 41, column: 9, scope: !47)
!55 = !DILocation(line: 41, column: 21, scope: !47)
!56 = !DILocation(line: 43, column: 17, scope: !47)
!57 = !DILocation(line: 43, column: 23, scope: !47)
!58 = !DILocation(line: 43, column: 36, scope: !47)
!59 = !DILocation(line: 43, column: 29, scope: !47)
!60 = !DILocation(line: 43, column: 9, scope: !47)
!61 = !DILocation(line: 45, column: 9, scope: !47)
!62 = !DILocation(line: 45, column: 21, scope: !47)
!63 = !DILocation(line: 46, column: 20, scope: !47)
!64 = !DILocation(line: 46, column: 9, scope: !47)
!65 = !DILocation(line: 50, column: 1, scope: !16)
!66 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_wchar_t_ncpy_09_good", scope: !17, file: !17, line: 121, type: !18, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 123, column: 5, scope: !66)
!68 = !DILocation(line: 124, column: 5, scope: !66)
!69 = !DILocation(line: 125, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 137, type: !71, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !17, line: 137, type: !7)
!77 = !DILocation(line: 137, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !17, line: 137, type: !73)
!79 = !DILocation(line: 137, column: 27, scope: !70)
!80 = !DILocation(line: 140, column: 22, scope: !70)
!81 = !DILocation(line: 140, column: 12, scope: !70)
!82 = !DILocation(line: 140, column: 5, scope: !70)
!83 = !DILocation(line: 142, column: 5, scope: !70)
!84 = !DILocation(line: 143, column: 5, scope: !70)
!85 = !DILocation(line: 144, column: 5, scope: !70)
!86 = !DILocation(line: 147, column: 5, scope: !70)
!87 = !DILocation(line: 148, column: 5, scope: !70)
!88 = !DILocation(line: 149, column: 5, scope: !70)
!89 = !DILocation(line: 151, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !17, line: 59, type: !4)
!92 = !DILocation(line: 59, column: 15, scope: !90)
!93 = !DILocation(line: 60, column: 10, scope: !90)
!94 = !DILocation(line: 61, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !17, line: 61, column: 8)
!96 = !DILocation(line: 61, column: 8, scope: !90)
!97 = !DILocation(line: 64, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !17, line: 62, column: 5)
!99 = !DILocation(line: 65, column: 5, scope: !98)
!100 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !17, line: 69, type: !4)
!101 = distinct !DILexicalBlock(scope: !102, file: !17, line: 68, column: 9)
!102 = distinct !DILexicalBlock(scope: !95, file: !17, line: 67, column: 5)
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
!118 = !DILocalVariable(name: "dest", scope: !119, file: !17, line: 78, type: !48)
!119 = distinct !DILexicalBlock(scope: !90, file: !17, line: 77, column: 5)
!120 = !DILocation(line: 78, column: 17, scope: !119)
!121 = !DILocation(line: 79, column: 17, scope: !119)
!122 = !DILocation(line: 79, column: 9, scope: !119)
!123 = !DILocation(line: 80, column: 9, scope: !119)
!124 = !DILocation(line: 80, column: 21, scope: !119)
!125 = !DILocation(line: 82, column: 17, scope: !119)
!126 = !DILocation(line: 82, column: 23, scope: !119)
!127 = !DILocation(line: 82, column: 36, scope: !119)
!128 = !DILocation(line: 82, column: 29, scope: !119)
!129 = !DILocation(line: 82, column: 9, scope: !119)
!130 = !DILocation(line: 84, column: 9, scope: !119)
!131 = !DILocation(line: 84, column: 21, scope: !119)
!132 = !DILocation(line: 85, column: 20, scope: !119)
!133 = !DILocation(line: 85, column: 9, scope: !119)
!134 = !DILocation(line: 89, column: 1, scope: !90)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocalVariable(name: "data", scope: !135, file: !17, line: 94, type: !4)
!137 = !DILocation(line: 94, column: 15, scope: !135)
!138 = !DILocation(line: 95, column: 10, scope: !135)
!139 = !DILocation(line: 96, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !17, line: 96, column: 8)
!141 = !DILocation(line: 96, column: 8, scope: !135)
!142 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !17, line: 99, type: !4)
!143 = distinct !DILexicalBlock(scope: !144, file: !17, line: 98, column: 9)
!144 = distinct !DILexicalBlock(scope: !140, file: !17, line: 97, column: 5)
!145 = !DILocation(line: 99, column: 23, scope: !143)
!146 = !DILocation(line: 99, column: 47, scope: !143)
!147 = !DILocation(line: 99, column: 36, scope: !143)
!148 = !DILocation(line: 100, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !17, line: 100, column: 17)
!150 = !DILocation(line: 100, column: 28, scope: !149)
!151 = !DILocation(line: 100, column: 17, scope: !143)
!152 = !DILocation(line: 100, column: 38, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !17, line: 100, column: 37)
!154 = !DILocation(line: 101, column: 21, scope: !143)
!155 = !DILocation(line: 101, column: 13, scope: !143)
!156 = !DILocation(line: 102, column: 13, scope: !143)
!157 = !DILocation(line: 102, column: 31, scope: !143)
!158 = !DILocation(line: 104, column: 20, scope: !143)
!159 = !DILocation(line: 104, column: 18, scope: !143)
!160 = !DILocation(line: 106, column: 5, scope: !144)
!161 = !DILocalVariable(name: "dest", scope: !162, file: !17, line: 108, type: !48)
!162 = distinct !DILexicalBlock(scope: !135, file: !17, line: 107, column: 5)
!163 = !DILocation(line: 108, column: 17, scope: !162)
!164 = !DILocation(line: 109, column: 17, scope: !162)
!165 = !DILocation(line: 109, column: 9, scope: !162)
!166 = !DILocation(line: 110, column: 9, scope: !162)
!167 = !DILocation(line: 110, column: 21, scope: !162)
!168 = !DILocation(line: 112, column: 17, scope: !162)
!169 = !DILocation(line: 112, column: 23, scope: !162)
!170 = !DILocation(line: 112, column: 36, scope: !162)
!171 = !DILocation(line: 112, column: 29, scope: !162)
!172 = !DILocation(line: 112, column: 9, scope: !162)
!173 = !DILocation(line: 114, column: 9, scope: !162)
!174 = !DILocation(line: 114, column: 21, scope: !162)
!175 = !DILocation(line: 115, column: 20, scope: !162)
!176 = !DILocation(line: 115, column: 9, scope: !162)
!177 = !DILocation(line: 119, column: 1, scope: !135)
