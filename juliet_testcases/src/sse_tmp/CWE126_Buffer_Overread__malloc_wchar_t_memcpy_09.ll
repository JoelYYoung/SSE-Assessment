; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09.c"
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
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !23
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.end3, !dbg !25

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 200) #7, !dbg !26
  %1 = bitcast i8* %call to i32*, !dbg !28
  store i32* %1, i32** %data, align 8, !dbg !29
  %2 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %2, null, !dbg !32
  br i1 %cmp, label %if.then1, label %if.end, !dbg !33

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !36
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 49) #7, !dbg !37
  %4 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !48
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx5, align 4, !dbg !50
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !51
  %6 = load i32*, i32** %data, align 8, !dbg !52
  %7 = bitcast i32* %6 to i8*, !dbg !51
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call8 = call i64 @wcslen(i32* %arraydecay7) #9, !dbg !54
  %mul = mul i64 %call8, 4, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !51
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx9, align 4, !dbg !57
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay10), !dbg !59
  %8 = load i32*, i32** %data, align 8, !dbg !60
  %9 = bitcast i32* %8 to i8*, !dbg !60
  call void @free(i8* %9) #7, !dbg !61
  ret void, !dbg !62
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !97
  %1 = bitcast i8* %call to i32*, !dbg !99
  store i32* %1, i32** %data, align 8, !dbg !100
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %cmp = icmp eq i32* %2, null, !dbg !103
  br i1 %cmp, label %if.then1, label %if.end, !dbg !104

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %data, align 8, !dbg !107
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !108
  %4 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !115
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx5, align 4, !dbg !117
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !118
  %6 = load i32*, i32** %data, align 8, !dbg !119
  %7 = bitcast i32* %6 to i8*, !dbg !118
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %call8 = call i64 @wcslen(i32* %arraydecay7) #9, !dbg !121
  %mul = mul i64 %call8, 4, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !118
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx9, align 4, !dbg !124
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* %arraydecay10), !dbg !126
  %8 = load i32*, i32** %data, align 8, !dbg !127
  %9 = bitcast i32* %8 to i8*, !dbg !127
  call void @free(i8* %9) #7, !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !131, metadata !DIExpression()), !dbg !132
  store i32* null, i32** %data, align 8, !dbg !133
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !134
  %tobool = icmp ne i32 %0, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.end3, !dbg !136

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !137
  %1 = bitcast i8* %call to i32*, !dbg !139
  store i32* %1, i32** %data, align 8, !dbg !140
  %2 = load i32*, i32** %data, align 8, !dbg !141
  %cmp = icmp eq i32* %2, null, !dbg !143
  br i1 %cmp, label %if.then1, label %if.end, !dbg !144

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %data, align 8, !dbg !147
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #7, !dbg !148
  %4 = load i32*, i32** %data, align 8, !dbg !149
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !149
  store i32 0, i32* %arrayidx, align 4, !dbg !150
  br label %if.end3, !dbg !151

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !152, metadata !DIExpression()), !dbg !154
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #7, !dbg !156
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !157
  store i32 0, i32* %arrayidx5, align 4, !dbg !158
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %5 = bitcast i32* %arraydecay6 to i8*, !dbg !159
  %6 = load i32*, i32** %data, align 8, !dbg !160
  %7 = bitcast i32* %6 to i8*, !dbg !159
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  %call8 = call i64 @wcslen(i32* %arraydecay7) #9, !dbg !162
  %mul = mul i64 %call8, 4, !dbg !163
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !159
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !164
  store i32 0, i32* %arrayidx9, align 4, !dbg !165
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !166
  call void @printWLine(i32* %arraydecay10), !dbg !167
  %8 = load i32*, i32** %data, align 8, !dbg !168
  %9 = bitcast i32* %8 to i8*, !dbg !168
  call void @free(i8* %9) #7, !dbg !169
  ret void, !dbg !170
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 17, scope: !27)
!37 = !DILocation(line: 32, column: 9, scope: !27)
!38 = !DILocation(line: 33, column: 9, scope: !27)
!39 = !DILocation(line: 33, column: 20, scope: !27)
!40 = !DILocation(line: 34, column: 5, scope: !27)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !17, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 36, column: 17, scope: !42)
!47 = !DILocation(line: 37, column: 17, scope: !42)
!48 = !DILocation(line: 37, column: 9, scope: !42)
!49 = !DILocation(line: 38, column: 9, scope: !42)
!50 = !DILocation(line: 38, column: 21, scope: !42)
!51 = !DILocation(line: 41, column: 9, scope: !42)
!52 = !DILocation(line: 41, column: 22, scope: !42)
!53 = !DILocation(line: 41, column: 35, scope: !42)
!54 = !DILocation(line: 41, column: 28, scope: !42)
!55 = !DILocation(line: 41, column: 40, scope: !42)
!56 = !DILocation(line: 42, column: 9, scope: !42)
!57 = !DILocation(line: 42, column: 21, scope: !42)
!58 = !DILocation(line: 43, column: 20, scope: !42)
!59 = !DILocation(line: 43, column: 9, scope: !42)
!60 = !DILocation(line: 44, column: 14, scope: !42)
!61 = !DILocation(line: 44, column: 9, scope: !42)
!62 = !DILocation(line: 46, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_09_good", scope: !17, file: !17, line: 109, type: !18, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 111, column: 5, scope: !63)
!65 = !DILocation(line: 112, column: 5, scope: !63)
!66 = !DILocation(line: 113, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 125, type: !68, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 125, type: !7)
!74 = !DILocation(line: 125, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 125, type: !70)
!76 = !DILocation(line: 125, column: 27, scope: !67)
!77 = !DILocation(line: 128, column: 22, scope: !67)
!78 = !DILocation(line: 128, column: 12, scope: !67)
!79 = !DILocation(line: 128, column: 5, scope: !67)
!80 = !DILocation(line: 130, column: 5, scope: !67)
!81 = !DILocation(line: 131, column: 5, scope: !67)
!82 = !DILocation(line: 132, column: 5, scope: !67)
!83 = !DILocation(line: 135, column: 5, scope: !67)
!84 = !DILocation(line: 136, column: 5, scope: !67)
!85 = !DILocation(line: 137, column: 5, scope: !67)
!86 = !DILocation(line: 139, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 55, type: !4)
!89 = !DILocation(line: 55, column: 15, scope: !87)
!90 = !DILocation(line: 56, column: 10, scope: !87)
!91 = !DILocation(line: 57, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !17, line: 57, column: 8)
!93 = !DILocation(line: 57, column: 8, scope: !87)
!94 = !DILocation(line: 60, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !17, line: 58, column: 5)
!96 = !DILocation(line: 61, column: 5, scope: !95)
!97 = !DILocation(line: 65, column: 27, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !17, line: 63, column: 5)
!99 = !DILocation(line: 65, column: 16, scope: !98)
!100 = !DILocation(line: 65, column: 14, scope: !98)
!101 = !DILocation(line: 66, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !17, line: 66, column: 13)
!103 = !DILocation(line: 66, column: 18, scope: !102)
!104 = !DILocation(line: 66, column: 13, scope: !98)
!105 = !DILocation(line: 66, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !17, line: 66, column: 27)
!107 = !DILocation(line: 67, column: 17, scope: !98)
!108 = !DILocation(line: 67, column: 9, scope: !98)
!109 = !DILocation(line: 68, column: 9, scope: !98)
!110 = !DILocation(line: 68, column: 21, scope: !98)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !17, line: 71, type: !43)
!112 = distinct !DILexicalBlock(scope: !87, file: !17, line: 70, column: 5)
!113 = !DILocation(line: 71, column: 17, scope: !112)
!114 = !DILocation(line: 72, column: 17, scope: !112)
!115 = !DILocation(line: 72, column: 9, scope: !112)
!116 = !DILocation(line: 73, column: 9, scope: !112)
!117 = !DILocation(line: 73, column: 21, scope: !112)
!118 = !DILocation(line: 76, column: 9, scope: !112)
!119 = !DILocation(line: 76, column: 22, scope: !112)
!120 = !DILocation(line: 76, column: 35, scope: !112)
!121 = !DILocation(line: 76, column: 28, scope: !112)
!122 = !DILocation(line: 76, column: 40, scope: !112)
!123 = !DILocation(line: 77, column: 9, scope: !112)
!124 = !DILocation(line: 77, column: 21, scope: !112)
!125 = !DILocation(line: 78, column: 20, scope: !112)
!126 = !DILocation(line: 78, column: 9, scope: !112)
!127 = !DILocation(line: 79, column: 14, scope: !112)
!128 = !DILocation(line: 79, column: 9, scope: !112)
!129 = !DILocation(line: 81, column: 1, scope: !87)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DILocalVariable(name: "data", scope: !130, file: !17, line: 86, type: !4)
!132 = !DILocation(line: 86, column: 15, scope: !130)
!133 = !DILocation(line: 87, column: 10, scope: !130)
!134 = !DILocation(line: 88, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !130, file: !17, line: 88, column: 8)
!136 = !DILocation(line: 88, column: 8, scope: !130)
!137 = !DILocation(line: 91, column: 27, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !17, line: 89, column: 5)
!139 = !DILocation(line: 91, column: 16, scope: !138)
!140 = !DILocation(line: 91, column: 14, scope: !138)
!141 = !DILocation(line: 92, column: 13, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !17, line: 92, column: 13)
!143 = !DILocation(line: 92, column: 18, scope: !142)
!144 = !DILocation(line: 92, column: 13, scope: !138)
!145 = !DILocation(line: 92, column: 28, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !17, line: 92, column: 27)
!147 = !DILocation(line: 93, column: 17, scope: !138)
!148 = !DILocation(line: 93, column: 9, scope: !138)
!149 = !DILocation(line: 94, column: 9, scope: !138)
!150 = !DILocation(line: 94, column: 21, scope: !138)
!151 = !DILocation(line: 95, column: 5, scope: !138)
!152 = !DILocalVariable(name: "dest", scope: !153, file: !17, line: 97, type: !43)
!153 = distinct !DILexicalBlock(scope: !130, file: !17, line: 96, column: 5)
!154 = !DILocation(line: 97, column: 17, scope: !153)
!155 = !DILocation(line: 98, column: 17, scope: !153)
!156 = !DILocation(line: 98, column: 9, scope: !153)
!157 = !DILocation(line: 99, column: 9, scope: !153)
!158 = !DILocation(line: 99, column: 21, scope: !153)
!159 = !DILocation(line: 102, column: 9, scope: !153)
!160 = !DILocation(line: 102, column: 22, scope: !153)
!161 = !DILocation(line: 102, column: 35, scope: !153)
!162 = !DILocation(line: 102, column: 28, scope: !153)
!163 = !DILocation(line: 102, column: 40, scope: !153)
!164 = !DILocation(line: 103, column: 9, scope: !153)
!165 = !DILocation(line: 103, column: 21, scope: !153)
!166 = !DILocation(line: 104, column: 20, scope: !153)
!167 = !DILocation(line: 104, column: 9, scope: !153)
!168 = !DILocation(line: 105, column: 14, scope: !153)
!169 = !DILocation(line: 105, column: 9, scope: !153)
!170 = !DILocation(line: 107, column: 1, scope: !130)
