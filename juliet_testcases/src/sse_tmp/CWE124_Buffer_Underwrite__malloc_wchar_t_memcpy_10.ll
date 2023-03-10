; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %0 = load i32, i32* @globalTrue, align 4, !dbg !23
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !53
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx5, align 4, !dbg !55
  %6 = load i32*, i32** %data, align 8, !dbg !56
  %7 = bitcast i32* %6 to i8*, !dbg !57
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !57
  %8 = bitcast i32* %arraydecay6 to i8*, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !57
  %9 = load i32*, i32** %data, align 8, !dbg !58
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !58
  store i32 0, i32* %arrayidx7, align 4, !dbg !59
  %10 = load i32*, i32** %data, align 8, !dbg !60
  call void @printWLine(i32* %10), !dbg !61
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10_good() #0 !dbg !63 {
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
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i32* null, i32** %data, align 8, !dbg !90
  %0 = load i32, i32* @globalFalse, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.else, !dbg !93

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  br label %if.end3, !dbg !96

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !101
  %1 = bitcast i8* %call to i32*, !dbg !102
  store i32* %1, i32** %dataBuffer, align 8, !dbg !100
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !103
  %cmp = icmp eq i32* %2, null, !dbg !105
  br i1 %cmp, label %if.then1, label %if.end, !dbg !106

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %if.else
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !110
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  store i32* %5, i32** %data, align 8, !dbg !114
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !118
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !119
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx5, align 4, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !122
  %7 = bitcast i32* %6 to i8*, !dbg !123
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %8 = bitcast i32* %arraydecay6 to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !123
  %9 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !124
  store i32 0, i32* %arrayidx7, align 4, !dbg !125
  %10 = load i32*, i32** %data, align 8, !dbg !126
  call void @printWLine(i32* %10), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !129 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i32* null, i32** %data, align 8, !dbg !132
  %0 = load i32, i32* @globalTrue, align 4, !dbg !133
  %tobool = icmp ne i32 %0, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.end3, !dbg !135

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !136, metadata !DIExpression()), !dbg !139
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !140
  %1 = bitcast i8* %call to i32*, !dbg !141
  store i32* %1, i32** %dataBuffer, align 8, !dbg !139
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !142
  %cmp = icmp eq i32* %2, null, !dbg !144
  br i1 %cmp, label %if.then1, label %if.end, !dbg !145

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %if.then
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  %call2 = call i32* @wmemset(i32* %3, i32 65, i64 99) #6, !dbg !149
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  %5 = load i32*, i32** %dataBuffer, align 8, !dbg !152
  store i32* %5, i32** %data, align 8, !dbg !153
  br label %if.end3, !dbg !154

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !155, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !158
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !159
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx5, align 4, !dbg !161
  %6 = load i32*, i32** %data, align 8, !dbg !162
  %7 = bitcast i32* %6 to i8*, !dbg !163
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !163
  %8 = bitcast i32* %arraydecay6 to i8*, !dbg !163
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !163
  %9 = load i32*, i32** %data, align 8, !dbg !164
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !164
  store i32 0, i32* %arrayidx7, align 4, !dbg !165
  %10 = load i32*, i32** %data, align 8, !dbg !166
  call void @printWLine(i32* %10), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10.c", directory: "/home/joelyang/SSE-Assessment")
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
!46 = !DILocalVariable(name: "source", scope: !47, file: !17, line: 39, type: !48)
!47 = distinct !DILexicalBlock(scope: !16, file: !17, line: 38, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 39, column: 17, scope: !47)
!52 = !DILocation(line: 40, column: 17, scope: !47)
!53 = !DILocation(line: 40, column: 9, scope: !47)
!54 = !DILocation(line: 41, column: 9, scope: !47)
!55 = !DILocation(line: 41, column: 23, scope: !47)
!56 = !DILocation(line: 43, column: 16, scope: !47)
!57 = !DILocation(line: 43, column: 9, scope: !47)
!58 = !DILocation(line: 45, column: 9, scope: !47)
!59 = !DILocation(line: 45, column: 21, scope: !47)
!60 = !DILocation(line: 46, column: 20, scope: !47)
!61 = !DILocation(line: 46, column: 9, scope: !47)
!62 = !DILocation(line: 50, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_memcpy_10_good", scope: !17, file: !17, line: 121, type: !18, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 123, column: 5, scope: !63)
!65 = !DILocation(line: 124, column: 5, scope: !63)
!66 = !DILocation(line: 125, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 137, type: !68, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!7, !7, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !17, line: 137, type: !7)
!74 = !DILocation(line: 137, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !17, line: 137, type: !70)
!76 = !DILocation(line: 137, column: 27, scope: !67)
!77 = !DILocation(line: 140, column: 22, scope: !67)
!78 = !DILocation(line: 140, column: 12, scope: !67)
!79 = !DILocation(line: 140, column: 5, scope: !67)
!80 = !DILocation(line: 142, column: 5, scope: !67)
!81 = !DILocation(line: 143, column: 5, scope: !67)
!82 = !DILocation(line: 144, column: 5, scope: !67)
!83 = !DILocation(line: 147, column: 5, scope: !67)
!84 = !DILocation(line: 148, column: 5, scope: !67)
!85 = !DILocation(line: 149, column: 5, scope: !67)
!86 = !DILocation(line: 151, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !17, line: 59, type: !4)
!89 = !DILocation(line: 59, column: 15, scope: !87)
!90 = !DILocation(line: 60, column: 10, scope: !87)
!91 = !DILocation(line: 61, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !17, line: 61, column: 8)
!93 = !DILocation(line: 61, column: 8, scope: !87)
!94 = !DILocation(line: 64, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !17, line: 62, column: 5)
!96 = !DILocation(line: 65, column: 5, scope: !95)
!97 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !17, line: 69, type: !4)
!98 = distinct !DILexicalBlock(scope: !99, file: !17, line: 68, column: 9)
!99 = distinct !DILexicalBlock(scope: !92, file: !17, line: 67, column: 5)
!100 = !DILocation(line: 69, column: 23, scope: !98)
!101 = !DILocation(line: 69, column: 47, scope: !98)
!102 = !DILocation(line: 69, column: 36, scope: !98)
!103 = !DILocation(line: 70, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !17, line: 70, column: 17)
!105 = !DILocation(line: 70, column: 28, scope: !104)
!106 = !DILocation(line: 70, column: 17, scope: !98)
!107 = !DILocation(line: 70, column: 38, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !17, line: 70, column: 37)
!109 = !DILocation(line: 71, column: 21, scope: !98)
!110 = !DILocation(line: 71, column: 13, scope: !98)
!111 = !DILocation(line: 72, column: 13, scope: !98)
!112 = !DILocation(line: 72, column: 31, scope: !98)
!113 = !DILocation(line: 74, column: 20, scope: !98)
!114 = !DILocation(line: 74, column: 18, scope: !98)
!115 = !DILocalVariable(name: "source", scope: !116, file: !17, line: 78, type: !48)
!116 = distinct !DILexicalBlock(scope: !87, file: !17, line: 77, column: 5)
!117 = !DILocation(line: 78, column: 17, scope: !116)
!118 = !DILocation(line: 79, column: 17, scope: !116)
!119 = !DILocation(line: 79, column: 9, scope: !116)
!120 = !DILocation(line: 80, column: 9, scope: !116)
!121 = !DILocation(line: 80, column: 23, scope: !116)
!122 = !DILocation(line: 82, column: 16, scope: !116)
!123 = !DILocation(line: 82, column: 9, scope: !116)
!124 = !DILocation(line: 84, column: 9, scope: !116)
!125 = !DILocation(line: 84, column: 21, scope: !116)
!126 = !DILocation(line: 85, column: 20, scope: !116)
!127 = !DILocation(line: 85, column: 9, scope: !116)
!128 = !DILocation(line: 89, column: 1, scope: !87)
!129 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 92, type: !18, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocalVariable(name: "data", scope: !129, file: !17, line: 94, type: !4)
!131 = !DILocation(line: 94, column: 15, scope: !129)
!132 = !DILocation(line: 95, column: 10, scope: !129)
!133 = !DILocation(line: 96, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !17, line: 96, column: 8)
!135 = !DILocation(line: 96, column: 8, scope: !129)
!136 = !DILocalVariable(name: "dataBuffer", scope: !137, file: !17, line: 99, type: !4)
!137 = distinct !DILexicalBlock(scope: !138, file: !17, line: 98, column: 9)
!138 = distinct !DILexicalBlock(scope: !134, file: !17, line: 97, column: 5)
!139 = !DILocation(line: 99, column: 23, scope: !137)
!140 = !DILocation(line: 99, column: 47, scope: !137)
!141 = !DILocation(line: 99, column: 36, scope: !137)
!142 = !DILocation(line: 100, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !17, line: 100, column: 17)
!144 = !DILocation(line: 100, column: 28, scope: !143)
!145 = !DILocation(line: 100, column: 17, scope: !137)
!146 = !DILocation(line: 100, column: 38, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !17, line: 100, column: 37)
!148 = !DILocation(line: 101, column: 21, scope: !137)
!149 = !DILocation(line: 101, column: 13, scope: !137)
!150 = !DILocation(line: 102, column: 13, scope: !137)
!151 = !DILocation(line: 102, column: 31, scope: !137)
!152 = !DILocation(line: 104, column: 20, scope: !137)
!153 = !DILocation(line: 104, column: 18, scope: !137)
!154 = !DILocation(line: 106, column: 5, scope: !138)
!155 = !DILocalVariable(name: "source", scope: !156, file: !17, line: 108, type: !48)
!156 = distinct !DILexicalBlock(scope: !129, file: !17, line: 107, column: 5)
!157 = !DILocation(line: 108, column: 17, scope: !156)
!158 = !DILocation(line: 109, column: 17, scope: !156)
!159 = !DILocation(line: 109, column: 9, scope: !156)
!160 = !DILocation(line: 110, column: 9, scope: !156)
!161 = !DILocation(line: 110, column: 23, scope: !156)
!162 = !DILocation(line: 112, column: 16, scope: !156)
!163 = !DILocation(line: 112, column: 9, scope: !156)
!164 = !DILocation(line: 114, column: 9, scope: !156)
!165 = !DILocation(line: 114, column: 21, scope: !156)
!166 = !DILocation(line: 115, column: 20, scope: !156)
!167 = !DILocation(line: 115, column: 9, scope: !156)
!168 = !DILocation(line: 119, column: 1, scope: !129)
