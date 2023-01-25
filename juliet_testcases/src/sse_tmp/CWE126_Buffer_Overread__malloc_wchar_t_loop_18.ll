; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_18.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  br label %source, !dbg !23

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !24), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !52
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx3, align 4, !dbg !54
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !56
  store i64 %call5, i64* %destLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !61
  %5 = load i64, i64* %destLen, align 8, !dbg !63
  %cmp6 = icmp ult i64 %4, %5, !dbg !64
  br i1 %cmp6, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !66
  %7 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !66
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !66
  %9 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !70
  store i32 %8, i32* %arrayidx8, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %10, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !78
  store i32 0, i32* %arrayidx9, align 4, !dbg !79
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !80
  call void @printWLine(i32* %arraydecay10), !dbg !81
  %11 = load i32*, i32** %data, align 8, !dbg !82
  %12 = bitcast i32* %11 to i8*, !dbg !82
  call void @free(i8* %12) #6, !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_18_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #6, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #6, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_18_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_18_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i32* null, i32** %data, align 8, !dbg !111
  br label %source, !dbg !112

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !113), !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !115
  %0 = bitcast i8* %call to i32*, !dbg !116
  store i32* %0, i32** %data, align 8, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #7, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %source
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !125
  %3 = load i32*, i32** %data, align 8, !dbg !126
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !136
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx3, align 4, !dbg !138
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call5 = call i64 @wcslen(i32* %arraydecay4) #8, !dbg !140
  store i64 %call5, i64* %destLen, align 8, !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !145
  %5 = load i64, i64* %destLen, align 8, !dbg !147
  %cmp6 = icmp ult i64 %4, %5, !dbg !148
  br i1 %cmp6, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !150
  %7 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !150
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !150
  %9 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !154
  store i32 %8, i32* %arrayidx8, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %10, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx9, align 4, !dbg !162
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  call void @printWLine(i32* %arraydecay10), !dbg !164
  %11 = load i32*, i32** %data, align 8, !dbg !165
  %12 = bitcast i32* %11 to i8*, !dbg !165
  call void @free(i8* %12) #6, !dbg !166
  ret void, !dbg !167
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_18_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_18.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 5, scope: !16)
!24 = !DILabel(scope: !16, name: "source", file: !17, line: 28)
!25 = !DILocation(line: 28, column: 1, scope: !16)
!26 = !DILocation(line: 30, column: 23, scope: !16)
!27 = !DILocation(line: 30, column: 12, scope: !16)
!28 = !DILocation(line: 30, column: 10, scope: !16)
!29 = !DILocation(line: 31, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !16, file: !17, line: 31, column: 9)
!31 = !DILocation(line: 31, column: 14, scope: !30)
!32 = !DILocation(line: 31, column: 9, scope: !16)
!33 = !DILocation(line: 31, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !17, line: 31, column: 23)
!35 = !DILocation(line: 32, column: 13, scope: !16)
!36 = !DILocation(line: 32, column: 5, scope: !16)
!37 = !DILocation(line: 33, column: 5, scope: !16)
!38 = !DILocation(line: 33, column: 16, scope: !16)
!39 = !DILocalVariable(name: "i", scope: !40, file: !17, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 35, column: 16, scope: !40)
!44 = !DILocalVariable(name: "destLen", scope: !40, file: !17, line: 35, type: !41)
!45 = !DILocation(line: 35, column: 19, scope: !40)
!46 = !DILocalVariable(name: "dest", scope: !40, file: !17, line: 36, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 36, column: 17, scope: !40)
!51 = !DILocation(line: 37, column: 17, scope: !40)
!52 = !DILocation(line: 37, column: 9, scope: !40)
!53 = !DILocation(line: 38, column: 9, scope: !40)
!54 = !DILocation(line: 38, column: 21, scope: !40)
!55 = !DILocation(line: 39, column: 26, scope: !40)
!56 = !DILocation(line: 39, column: 19, scope: !40)
!57 = !DILocation(line: 39, column: 17, scope: !40)
!58 = !DILocation(line: 42, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !40, file: !17, line: 42, column: 9)
!60 = !DILocation(line: 42, column: 14, scope: !59)
!61 = !DILocation(line: 42, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !17, line: 42, column: 9)
!63 = !DILocation(line: 42, column: 25, scope: !62)
!64 = !DILocation(line: 42, column: 23, scope: !62)
!65 = !DILocation(line: 42, column: 9, scope: !59)
!66 = !DILocation(line: 44, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !17, line: 43, column: 9)
!68 = !DILocation(line: 44, column: 28, scope: !67)
!69 = !DILocation(line: 44, column: 18, scope: !67)
!70 = !DILocation(line: 44, column: 13, scope: !67)
!71 = !DILocation(line: 44, column: 21, scope: !67)
!72 = !DILocation(line: 45, column: 9, scope: !67)
!73 = !DILocation(line: 42, column: 35, scope: !62)
!74 = !DILocation(line: 42, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 45, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 46, column: 9, scope: !40)
!79 = !DILocation(line: 46, column: 21, scope: !40)
!80 = !DILocation(line: 47, column: 20, scope: !40)
!81 = !DILocation(line: 47, column: 9, scope: !40)
!82 = !DILocation(line: 48, column: 14, scope: !40)
!83 = !DILocation(line: 48, column: 9, scope: !40)
!84 = !DILocation(line: 50, column: 1, scope: !16)
!85 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_18_good", scope: !17, file: !17, line: 86, type: !18, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 88, column: 5, scope: !85)
!87 = !DILocation(line: 89, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 101, type: !89, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7, !7, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !17, line: 101, type: !7)
!95 = !DILocation(line: 101, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !17, line: 101, type: !91)
!97 = !DILocation(line: 101, column: 27, scope: !88)
!98 = !DILocation(line: 104, column: 22, scope: !88)
!99 = !DILocation(line: 104, column: 12, scope: !88)
!100 = !DILocation(line: 104, column: 5, scope: !88)
!101 = !DILocation(line: 106, column: 5, scope: !88)
!102 = !DILocation(line: 107, column: 5, scope: !88)
!103 = !DILocation(line: 108, column: 5, scope: !88)
!104 = !DILocation(line: 111, column: 5, scope: !88)
!105 = !DILocation(line: 112, column: 5, scope: !88)
!106 = !DILocation(line: 113, column: 5, scope: !88)
!107 = !DILocation(line: 115, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 57, type: !18, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !17, line: 59, type: !4)
!110 = !DILocation(line: 59, column: 15, scope: !108)
!111 = !DILocation(line: 60, column: 10, scope: !108)
!112 = !DILocation(line: 61, column: 5, scope: !108)
!113 = !DILabel(scope: !108, name: "source", file: !17, line: 62)
!114 = !DILocation(line: 62, column: 1, scope: !108)
!115 = !DILocation(line: 64, column: 23, scope: !108)
!116 = !DILocation(line: 64, column: 12, scope: !108)
!117 = !DILocation(line: 64, column: 10, scope: !108)
!118 = !DILocation(line: 65, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !108, file: !17, line: 65, column: 9)
!120 = !DILocation(line: 65, column: 14, scope: !119)
!121 = !DILocation(line: 65, column: 9, scope: !108)
!122 = !DILocation(line: 65, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 65, column: 23)
!124 = !DILocation(line: 66, column: 13, scope: !108)
!125 = !DILocation(line: 66, column: 5, scope: !108)
!126 = !DILocation(line: 67, column: 5, scope: !108)
!127 = !DILocation(line: 67, column: 17, scope: !108)
!128 = !DILocalVariable(name: "i", scope: !129, file: !17, line: 69, type: !41)
!129 = distinct !DILexicalBlock(scope: !108, file: !17, line: 68, column: 5)
!130 = !DILocation(line: 69, column: 16, scope: !129)
!131 = !DILocalVariable(name: "destLen", scope: !129, file: !17, line: 69, type: !41)
!132 = !DILocation(line: 69, column: 19, scope: !129)
!133 = !DILocalVariable(name: "dest", scope: !129, file: !17, line: 70, type: !47)
!134 = !DILocation(line: 70, column: 17, scope: !129)
!135 = !DILocation(line: 71, column: 17, scope: !129)
!136 = !DILocation(line: 71, column: 9, scope: !129)
!137 = !DILocation(line: 72, column: 9, scope: !129)
!138 = !DILocation(line: 72, column: 21, scope: !129)
!139 = !DILocation(line: 73, column: 26, scope: !129)
!140 = !DILocation(line: 73, column: 19, scope: !129)
!141 = !DILocation(line: 73, column: 17, scope: !129)
!142 = !DILocation(line: 76, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !129, file: !17, line: 76, column: 9)
!144 = !DILocation(line: 76, column: 14, scope: !143)
!145 = !DILocation(line: 76, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !17, line: 76, column: 9)
!147 = !DILocation(line: 76, column: 25, scope: !146)
!148 = !DILocation(line: 76, column: 23, scope: !146)
!149 = !DILocation(line: 76, column: 9, scope: !143)
!150 = !DILocation(line: 78, column: 23, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !17, line: 77, column: 9)
!152 = !DILocation(line: 78, column: 28, scope: !151)
!153 = !DILocation(line: 78, column: 18, scope: !151)
!154 = !DILocation(line: 78, column: 13, scope: !151)
!155 = !DILocation(line: 78, column: 21, scope: !151)
!156 = !DILocation(line: 79, column: 9, scope: !151)
!157 = !DILocation(line: 76, column: 35, scope: !146)
!158 = !DILocation(line: 76, column: 9, scope: !146)
!159 = distinct !{!159, !149, !160, !77}
!160 = !DILocation(line: 79, column: 9, scope: !143)
!161 = !DILocation(line: 80, column: 9, scope: !129)
!162 = !DILocation(line: 80, column: 21, scope: !129)
!163 = !DILocation(line: 81, column: 20, scope: !129)
!164 = !DILocation(line: 81, column: 9, scope: !129)
!165 = !DILocation(line: 82, column: 14, scope: !129)
!166 = !DILocation(line: 82, column: 9, scope: !129)
!167 = !DILocation(line: 84, column: 1, scope: !108)
