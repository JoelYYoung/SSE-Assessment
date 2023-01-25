; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_13.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_13_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !23
  %cmp = icmp eq i32 %0, 5, !dbg !25
  br i1 %cmp, label %if.then, label %if.end4, !dbg !26

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !27
  %1 = bitcast i8* %call to i32*, !dbg !29
  store i32* %1, i32** %data, align 8, !dbg !30
  %2 = load i32*, i32** %data, align 8, !dbg !31
  %cmp1 = icmp eq i32* %2, null, !dbg !33
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !34

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end4, !dbg !41

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !48
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !49
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx6, align 4, !dbg !51
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %5 = bitcast i32* %arraydecay7 to i8*, !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %7 = bitcast i32* %6 to i8*, !dbg !52
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !55
  %mul = mul i64 %call9, 4, !dbg !56
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !52
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx10, align 4, !dbg !58
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* %arraydecay11), !dbg !60
  %8 = load i32*, i32** %data, align 8, !dbg !61
  %9 = bitcast i32* %8 to i8*, !dbg !61
  call void @free(i8* %9) #7, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_13_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #7, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #7, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_13_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_13_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  store i32* null, i32** %data, align 8, !dbg !91
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !92
  %cmp = icmp ne i32 %0, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end4, !dbg !98

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !99
  %1 = bitcast i8* %call to i32*, !dbg !101
  store i32* %1, i32** %data, align 8, !dbg !102
  %2 = load i32*, i32** %data, align 8, !dbg !103
  %cmp1 = icmp eq i32* %2, null, !dbg !105
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !106

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !109
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !110
  %4 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !116
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !117
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !118
  store i32 0, i32* %arrayidx6, align 4, !dbg !119
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %5 = bitcast i32* %arraydecay7 to i8*, !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  %7 = bitcast i32* %6 to i8*, !dbg !120
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !123
  %mul = mul i64 %call9, 4, !dbg !124
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !120
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx10, align 4, !dbg !126
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay11), !dbg !128
  %8 = load i32*, i32** %data, align 8, !dbg !129
  %9 = bitcast i32* %8 to i8*, !dbg !129
  call void @free(i8* %9) #7, !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !132 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !133, metadata !DIExpression()), !dbg !134
  store i32* null, i32** %data, align 8, !dbg !135
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !136
  %cmp = icmp eq i32 %0, 5, !dbg !138
  br i1 %cmp, label %if.then, label %if.end4, !dbg !139

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !140
  %1 = bitcast i8* %call to i32*, !dbg !142
  store i32* %1, i32** %data, align 8, !dbg !143
  %2 = load i32*, i32** %data, align 8, !dbg !144
  %cmp1 = icmp eq i32* %2, null, !dbg !146
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !147

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !150
  %call3 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !151
  %4 = load i32*, i32** %data, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  br label %if.end4, !dbg !154

if.end4:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !155, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !158
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !159
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx6, align 4, !dbg !161
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !162
  %5 = bitcast i32* %arraydecay7 to i8*, !dbg !162
  %6 = load i32*, i32** %data, align 8, !dbg !163
  %7 = bitcast i32* %6 to i8*, !dbg !162
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %call9 = call i64 @wcslen(i32* %arraydecay8) #9, !dbg !165
  %mul = mul i64 %call9, 4, !dbg !166
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !162
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !167
  store i32 0, i32* %arrayidx10, align 4, !dbg !168
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !169
  call void @printWLine(i32* %arraydecay11), !dbg !170
  %8 = load i32*, i32** %data, align 8, !dbg !171
  %9 = bitcast i32* %8 to i8*, !dbg !171
  call void @free(i8* %9) #7, !dbg !172
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_13.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_13_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_13.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 25, scope: !24)
!26 = !DILocation(line: 27, column: 8, scope: !16)
!27 = !DILocation(line: 30, column: 27, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 14, scope: !28)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !28)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !17, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 17, scope: !28)
!38 = !DILocation(line: 32, column: 9, scope: !28)
!39 = !DILocation(line: 33, column: 9, scope: !28)
!40 = !DILocation(line: 33, column: 20, scope: !28)
!41 = !DILocation(line: 34, column: 5, scope: !28)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !17, line: 36, type: !44)
!43 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 36, column: 17, scope: !43)
!48 = !DILocation(line: 37, column: 17, scope: !43)
!49 = !DILocation(line: 37, column: 9, scope: !43)
!50 = !DILocation(line: 38, column: 9, scope: !43)
!51 = !DILocation(line: 38, column: 21, scope: !43)
!52 = !DILocation(line: 41, column: 9, scope: !43)
!53 = !DILocation(line: 41, column: 23, scope: !43)
!54 = !DILocation(line: 41, column: 36, scope: !43)
!55 = !DILocation(line: 41, column: 29, scope: !43)
!56 = !DILocation(line: 41, column: 41, scope: !43)
!57 = !DILocation(line: 42, column: 9, scope: !43)
!58 = !DILocation(line: 42, column: 21, scope: !43)
!59 = !DILocation(line: 43, column: 20, scope: !43)
!60 = !DILocation(line: 43, column: 9, scope: !43)
!61 = !DILocation(line: 44, column: 14, scope: !43)
!62 = !DILocation(line: 44, column: 9, scope: !43)
!63 = !DILocation(line: 46, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_13_good", scope: !17, file: !17, line: 109, type: !18, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 111, column: 5, scope: !64)
!66 = !DILocation(line: 112, column: 5, scope: !64)
!67 = !DILocation(line: 113, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 125, type: !69, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !17, line: 125, type: !7)
!75 = !DILocation(line: 125, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !17, line: 125, type: !71)
!77 = !DILocation(line: 125, column: 27, scope: !68)
!78 = !DILocation(line: 128, column: 22, scope: !68)
!79 = !DILocation(line: 128, column: 12, scope: !68)
!80 = !DILocation(line: 128, column: 5, scope: !68)
!81 = !DILocation(line: 130, column: 5, scope: !68)
!82 = !DILocation(line: 131, column: 5, scope: !68)
!83 = !DILocation(line: 132, column: 5, scope: !68)
!84 = !DILocation(line: 135, column: 5, scope: !68)
!85 = !DILocation(line: 136, column: 5, scope: !68)
!86 = !DILocation(line: 137, column: 5, scope: !68)
!87 = !DILocation(line: 139, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !17, line: 55, type: !4)
!90 = !DILocation(line: 55, column: 15, scope: !88)
!91 = !DILocation(line: 56, column: 10, scope: !88)
!92 = !DILocation(line: 57, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !17, line: 57, column: 8)
!94 = !DILocation(line: 57, column: 25, scope: !93)
!95 = !DILocation(line: 57, column: 8, scope: !88)
!96 = !DILocation(line: 60, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !17, line: 58, column: 5)
!98 = !DILocation(line: 61, column: 5, scope: !97)
!99 = !DILocation(line: 65, column: 27, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !17, line: 63, column: 5)
!101 = !DILocation(line: 65, column: 16, scope: !100)
!102 = !DILocation(line: 65, column: 14, scope: !100)
!103 = !DILocation(line: 66, column: 13, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !17, line: 66, column: 13)
!105 = !DILocation(line: 66, column: 18, scope: !104)
!106 = !DILocation(line: 66, column: 13, scope: !100)
!107 = !DILocation(line: 66, column: 28, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !17, line: 66, column: 27)
!109 = !DILocation(line: 67, column: 17, scope: !100)
!110 = !DILocation(line: 67, column: 9, scope: !100)
!111 = !DILocation(line: 68, column: 9, scope: !100)
!112 = !DILocation(line: 68, column: 21, scope: !100)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !17, line: 71, type: !44)
!114 = distinct !DILexicalBlock(scope: !88, file: !17, line: 70, column: 5)
!115 = !DILocation(line: 71, column: 17, scope: !114)
!116 = !DILocation(line: 72, column: 17, scope: !114)
!117 = !DILocation(line: 72, column: 9, scope: !114)
!118 = !DILocation(line: 73, column: 9, scope: !114)
!119 = !DILocation(line: 73, column: 21, scope: !114)
!120 = !DILocation(line: 76, column: 9, scope: !114)
!121 = !DILocation(line: 76, column: 23, scope: !114)
!122 = !DILocation(line: 76, column: 36, scope: !114)
!123 = !DILocation(line: 76, column: 29, scope: !114)
!124 = !DILocation(line: 76, column: 41, scope: !114)
!125 = !DILocation(line: 77, column: 9, scope: !114)
!126 = !DILocation(line: 77, column: 21, scope: !114)
!127 = !DILocation(line: 78, column: 20, scope: !114)
!128 = !DILocation(line: 78, column: 9, scope: !114)
!129 = !DILocation(line: 79, column: 14, scope: !114)
!130 = !DILocation(line: 79, column: 9, scope: !114)
!131 = !DILocation(line: 81, column: 1, scope: !88)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DILocalVariable(name: "data", scope: !132, file: !17, line: 86, type: !4)
!134 = !DILocation(line: 86, column: 15, scope: !132)
!135 = !DILocation(line: 87, column: 10, scope: !132)
!136 = !DILocation(line: 88, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !132, file: !17, line: 88, column: 8)
!138 = !DILocation(line: 88, column: 25, scope: !137)
!139 = !DILocation(line: 88, column: 8, scope: !132)
!140 = !DILocation(line: 91, column: 27, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !17, line: 89, column: 5)
!142 = !DILocation(line: 91, column: 16, scope: !141)
!143 = !DILocation(line: 91, column: 14, scope: !141)
!144 = !DILocation(line: 92, column: 13, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !17, line: 92, column: 13)
!146 = !DILocation(line: 92, column: 18, scope: !145)
!147 = !DILocation(line: 92, column: 13, scope: !141)
!148 = !DILocation(line: 92, column: 28, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !17, line: 92, column: 27)
!150 = !DILocation(line: 93, column: 17, scope: !141)
!151 = !DILocation(line: 93, column: 9, scope: !141)
!152 = !DILocation(line: 94, column: 9, scope: !141)
!153 = !DILocation(line: 94, column: 21, scope: !141)
!154 = !DILocation(line: 95, column: 5, scope: !141)
!155 = !DILocalVariable(name: "dest", scope: !156, file: !17, line: 97, type: !44)
!156 = distinct !DILexicalBlock(scope: !132, file: !17, line: 96, column: 5)
!157 = !DILocation(line: 97, column: 17, scope: !156)
!158 = !DILocation(line: 98, column: 17, scope: !156)
!159 = !DILocation(line: 98, column: 9, scope: !156)
!160 = !DILocation(line: 99, column: 9, scope: !156)
!161 = !DILocation(line: 99, column: 21, scope: !156)
!162 = !DILocation(line: 102, column: 9, scope: !156)
!163 = !DILocation(line: 102, column: 23, scope: !156)
!164 = !DILocation(line: 102, column: 36, scope: !156)
!165 = !DILocation(line: 102, column: 29, scope: !156)
!166 = !DILocation(line: 102, column: 41, scope: !156)
!167 = !DILocation(line: 103, column: 9, scope: !156)
!168 = !DILocation(line: 103, column: 21, scope: !156)
!169 = !DILocation(line: 104, column: 20, scope: !156)
!170 = !DILocation(line: 104, column: 9, scope: !156)
!171 = !DILocation(line: 105, column: 14, scope: !156)
!172 = !DILocation(line: 105, column: 9, scope: !156)
!173 = !DILocation(line: 107, column: 1, scope: !132)
