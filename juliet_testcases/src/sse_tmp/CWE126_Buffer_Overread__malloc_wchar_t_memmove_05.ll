; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  %0 = load i32, i32* @staticTrue, align 4, !dbg !28
  %tobool = icmp ne i32 %0, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end3, !dbg !30

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !31
  %1 = bitcast i8* %call to i32*, !dbg !33
  store i32* %1, i32** %data, align 8, !dbg !34
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %cmp = icmp eq i32* %2, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !42
  %4 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %if.end3, !dbg !45

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !52
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !53
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx5, align 4, !dbg !55
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %7 = bitcast i32* %6 to i8*, !dbg !56
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call8 = call i64 @wcslen(i32* %arraydecay7) #9, !dbg !59
  %mul = mul i64 %call8, 4, !dbg !60
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !56
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx9, align 4, !dbg !62
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay10), !dbg !64
  %8 = load i32*, i32** %data, align 8, !dbg !65
  %9 = bitcast i32* %8 to i8*, !dbg !65
  call void @free(i8* %9) #7, !dbg !66
  ret void, !dbg !67
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_05_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_05_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_05_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  %0 = load i32, i32* @staticFalse, align 4, !dbg !96
  %tobool = icmp ne i32 %0, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end3, !dbg !101

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !102
  %1 = bitcast i8* %call to i32*, !dbg !104
  store i32* %1, i32** %data, align 8, !dbg !105
  %2 = load i32*, i32** %data, align 8, !dbg !106
  %cmp = icmp eq i32* %2, null, !dbg !108
  br i1 %cmp, label %if.then1, label %if.end, !dbg !109

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !112
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !113
  %4 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !114
  store i32 0, i32* %arrayidx, align 4, !dbg !115
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !120
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx5, align 4, !dbg !122
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !123
  %6 = load i32*, i32** %data, align 8, !dbg !124
  %7 = bitcast i32* %6 to i8*, !dbg !123
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call8 = call i64 @wcslen(i32* %arraydecay7) #9, !dbg !126
  %mul = mul i64 %call8, 4, !dbg !127
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !123
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx9, align 4, !dbg !129
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay10), !dbg !131
  %8 = load i32*, i32** %data, align 8, !dbg !132
  %9 = bitcast i32* %8 to i8*, !dbg !132
  call void @free(i8* %9) #7, !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !135 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i32* null, i32** %data, align 8, !dbg !138
  %0 = load i32, i32* @staticTrue, align 4, !dbg !139
  %tobool = icmp ne i32 %0, 0, !dbg !139
  br i1 %tobool, label %if.then, label %if.end3, !dbg !141

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !142
  %1 = bitcast i8* %call to i32*, !dbg !144
  store i32* %1, i32** %data, align 8, !dbg !145
  %2 = load i32*, i32** %data, align 8, !dbg !146
  %cmp = icmp eq i32* %2, null, !dbg !148
  br i1 %cmp, label %if.then1, label %if.end, !dbg !149

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !150
  unreachable, !dbg !150

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !152
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !153
  %4 = load i32*, i32** %data, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  br label %if.end3, !dbg !156

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !157, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !160
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !161
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !162
  store i32 0, i32* %arrayidx5, align 4, !dbg !163
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !164
  %6 = load i32*, i32** %data, align 8, !dbg !165
  %7 = bitcast i32* %6 to i8*, !dbg !164
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !166
  %call8 = call i64 @wcslen(i32* %arraydecay7) #9, !dbg !167
  %mul = mul i64 %call8, 4, !dbg !168
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !164
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx9, align 4, !dbg !170
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  call void @printWLine(i32* %arraydecay10), !dbg !172
  %8 = load i32*, i32** %data, align 8, !dbg !173
  %9 = bitcast i32* %8 to i8*, !dbg !173
  call void @free(i8* %9) #7, !dbg !174
  ret void, !dbg !175
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10, !11}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !9, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memmove_05.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_05_bad", scope: !15, file: !15, line: 30, type: !23, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !15, line: 32, type: !6)
!26 = !DILocation(line: 32, column: 15, scope: !22)
!27 = !DILocation(line: 33, column: 10, scope: !22)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !15, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 8, scope: !22)
!31 = !DILocation(line: 37, column: 27, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !15, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 16, scope: !32)
!34 = !DILocation(line: 37, column: 14, scope: !32)
!35 = !DILocation(line: 38, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 38, column: 13)
!37 = !DILocation(line: 38, column: 18, scope: !36)
!38 = !DILocation(line: 38, column: 13, scope: !32)
!39 = !DILocation(line: 38, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 38, column: 27)
!41 = !DILocation(line: 39, column: 17, scope: !32)
!42 = !DILocation(line: 39, column: 9, scope: !32)
!43 = !DILocation(line: 40, column: 9, scope: !32)
!44 = !DILocation(line: 40, column: 20, scope: !32)
!45 = !DILocation(line: 41, column: 5, scope: !32)
!46 = !DILocalVariable(name: "dest", scope: !47, file: !15, line: 43, type: !48)
!47 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 43, column: 17, scope: !47)
!52 = !DILocation(line: 44, column: 17, scope: !47)
!53 = !DILocation(line: 44, column: 9, scope: !47)
!54 = !DILocation(line: 45, column: 9, scope: !47)
!55 = !DILocation(line: 45, column: 21, scope: !47)
!56 = !DILocation(line: 48, column: 9, scope: !47)
!57 = !DILocation(line: 48, column: 23, scope: !47)
!58 = !DILocation(line: 48, column: 36, scope: !47)
!59 = !DILocation(line: 48, column: 29, scope: !47)
!60 = !DILocation(line: 48, column: 41, scope: !47)
!61 = !DILocation(line: 49, column: 9, scope: !47)
!62 = !DILocation(line: 49, column: 21, scope: !47)
!63 = !DILocation(line: 50, column: 20, scope: !47)
!64 = !DILocation(line: 50, column: 9, scope: !47)
!65 = !DILocation(line: 51, column: 14, scope: !47)
!66 = !DILocation(line: 51, column: 9, scope: !47)
!67 = !DILocation(line: 53, column: 1, scope: !22)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_05_good", scope: !15, file: !15, line: 116, type: !23, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 118, column: 5, scope: !68)
!70 = !DILocation(line: 119, column: 5, scope: !68)
!71 = !DILocation(line: 120, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 132, type: !73, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!9, !9, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !15, line: 132, type: !9)
!79 = !DILocation(line: 132, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !15, line: 132, type: !75)
!81 = !DILocation(line: 132, column: 27, scope: !72)
!82 = !DILocation(line: 135, column: 22, scope: !72)
!83 = !DILocation(line: 135, column: 12, scope: !72)
!84 = !DILocation(line: 135, column: 5, scope: !72)
!85 = !DILocation(line: 137, column: 5, scope: !72)
!86 = !DILocation(line: 138, column: 5, scope: !72)
!87 = !DILocation(line: 139, column: 5, scope: !72)
!88 = !DILocation(line: 142, column: 5, scope: !72)
!89 = !DILocation(line: 143, column: 5, scope: !72)
!90 = !DILocation(line: 144, column: 5, scope: !72)
!91 = !DILocation(line: 146, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !23, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !15, line: 62, type: !6)
!94 = !DILocation(line: 62, column: 15, scope: !92)
!95 = !DILocation(line: 63, column: 10, scope: !92)
!96 = !DILocation(line: 64, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !15, line: 64, column: 8)
!98 = !DILocation(line: 64, column: 8, scope: !92)
!99 = !DILocation(line: 67, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !15, line: 65, column: 5)
!101 = !DILocation(line: 68, column: 5, scope: !100)
!102 = !DILocation(line: 72, column: 27, scope: !103)
!103 = distinct !DILexicalBlock(scope: !97, file: !15, line: 70, column: 5)
!104 = !DILocation(line: 72, column: 16, scope: !103)
!105 = !DILocation(line: 72, column: 14, scope: !103)
!106 = !DILocation(line: 73, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 73, column: 13)
!108 = !DILocation(line: 73, column: 18, scope: !107)
!109 = !DILocation(line: 73, column: 13, scope: !103)
!110 = !DILocation(line: 73, column: 28, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !15, line: 73, column: 27)
!112 = !DILocation(line: 74, column: 17, scope: !103)
!113 = !DILocation(line: 74, column: 9, scope: !103)
!114 = !DILocation(line: 75, column: 9, scope: !103)
!115 = !DILocation(line: 75, column: 21, scope: !103)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !15, line: 78, type: !48)
!117 = distinct !DILexicalBlock(scope: !92, file: !15, line: 77, column: 5)
!118 = !DILocation(line: 78, column: 17, scope: !117)
!119 = !DILocation(line: 79, column: 17, scope: !117)
!120 = !DILocation(line: 79, column: 9, scope: !117)
!121 = !DILocation(line: 80, column: 9, scope: !117)
!122 = !DILocation(line: 80, column: 21, scope: !117)
!123 = !DILocation(line: 83, column: 9, scope: !117)
!124 = !DILocation(line: 83, column: 23, scope: !117)
!125 = !DILocation(line: 83, column: 36, scope: !117)
!126 = !DILocation(line: 83, column: 29, scope: !117)
!127 = !DILocation(line: 83, column: 41, scope: !117)
!128 = !DILocation(line: 84, column: 9, scope: !117)
!129 = !DILocation(line: 84, column: 21, scope: !117)
!130 = !DILocation(line: 85, column: 20, scope: !117)
!131 = !DILocation(line: 85, column: 9, scope: !117)
!132 = !DILocation(line: 86, column: 14, scope: !117)
!133 = !DILocation(line: 86, column: 9, scope: !117)
!134 = !DILocation(line: 88, column: 1, scope: !92)
!135 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 91, type: !23, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!136 = !DILocalVariable(name: "data", scope: !135, file: !15, line: 93, type: !6)
!137 = !DILocation(line: 93, column: 15, scope: !135)
!138 = !DILocation(line: 94, column: 10, scope: !135)
!139 = !DILocation(line: 95, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !15, line: 95, column: 8)
!141 = !DILocation(line: 95, column: 8, scope: !135)
!142 = !DILocation(line: 98, column: 27, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !15, line: 96, column: 5)
!144 = !DILocation(line: 98, column: 16, scope: !143)
!145 = !DILocation(line: 98, column: 14, scope: !143)
!146 = !DILocation(line: 99, column: 13, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !15, line: 99, column: 13)
!148 = !DILocation(line: 99, column: 18, scope: !147)
!149 = !DILocation(line: 99, column: 13, scope: !143)
!150 = !DILocation(line: 99, column: 28, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !15, line: 99, column: 27)
!152 = !DILocation(line: 100, column: 17, scope: !143)
!153 = !DILocation(line: 100, column: 9, scope: !143)
!154 = !DILocation(line: 101, column: 9, scope: !143)
!155 = !DILocation(line: 101, column: 21, scope: !143)
!156 = !DILocation(line: 102, column: 5, scope: !143)
!157 = !DILocalVariable(name: "dest", scope: !158, file: !15, line: 104, type: !48)
!158 = distinct !DILexicalBlock(scope: !135, file: !15, line: 103, column: 5)
!159 = !DILocation(line: 104, column: 17, scope: !158)
!160 = !DILocation(line: 105, column: 17, scope: !158)
!161 = !DILocation(line: 105, column: 9, scope: !158)
!162 = !DILocation(line: 106, column: 9, scope: !158)
!163 = !DILocation(line: 106, column: 21, scope: !158)
!164 = !DILocation(line: 109, column: 9, scope: !158)
!165 = !DILocation(line: 109, column: 23, scope: !158)
!166 = !DILocation(line: 109, column: 36, scope: !158)
!167 = !DILocation(line: 109, column: 29, scope: !158)
!168 = !DILocation(line: 109, column: 41, scope: !158)
!169 = !DILocation(line: 110, column: 9, scope: !158)
!170 = !DILocation(line: 110, column: 21, scope: !158)
!171 = !DILocation(line: 111, column: 20, scope: !158)
!172 = !DILocation(line: 111, column: 9, scope: !158)
!173 = !DILocation(line: 112, column: 14, scope: !158)
!174 = !DILocation(line: 112, column: 9, scope: !158)
!175 = !DILocation(line: 114, column: 1, scope: !135)
