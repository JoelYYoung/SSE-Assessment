; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_31_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !24
  store i32* %0, i32** %data, align 8, !dbg !25
  %1 = load i32*, i32** %data, align 8, !dbg !26
  %cmp = icmp eq i32* %1, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !32
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !33
  %3 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !36, metadata !DIExpression()), !dbg !38
  %4 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %4, i32** %dataCopy, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !40, metadata !DIExpression()), !dbg !41
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !42
  store i32* %5, i32** %data2, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !56
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx4, align 4, !dbg !58
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !60
  store i64 %call6, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !65
  %7 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp7 = icmp ult i64 %6, %7, !dbg !68
  br i1 %cmp7, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data2, align 8, !dbg !70
  %9 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !70
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !70
  %11 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !74
  store i32 %10, i32* %arrayidx9, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %12, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx10, align 4, !dbg !83
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  call void @printWLine(i32* %arraydecay11), !dbg !85
  %13 = load i32*, i32** %data2, align 8, !dbg !86
  %14 = bitcast i32* %13 to i8*, !dbg !86
  call void @free(i8* %14) #6, !dbg !87
  ret void, !dbg !88
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

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_31_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #6, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #6, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_31_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_31_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i32* null, i32** %data, align 8, !dbg !115
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !116
  %0 = bitcast i8* %call to i32*, !dbg !117
  store i32* %0, i32** %data, align 8, !dbg !118
  %1 = load i32*, i32** %data, align 8, !dbg !119
  %cmp = icmp eq i32* %1, null, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !125
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !126
  %3 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !129, metadata !DIExpression()), !dbg !131
  %4 = load i32*, i32** %data, align 8, !dbg !132
  store i32* %4, i32** %dataCopy, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !133, metadata !DIExpression()), !dbg !134
  %5 = load i32*, i32** %dataCopy, align 8, !dbg !135
  store i32* %5, i32** %data2, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !144
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx4, align 4, !dbg !146
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call6 = call i64 @wcslen(i32* %arraydecay5) #8, !dbg !148
  store i64 %call6, i64* %destLen, align 8, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !153
  %7 = load i64, i64* %destLen, align 8, !dbg !155
  %cmp7 = icmp ult i64 %6, %7, !dbg !156
  br i1 %cmp7, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data2, align 8, !dbg !158
  %9 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx8 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !158
  %10 = load i32, i32* %arrayidx8, align 4, !dbg !158
  %11 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !162
  store i32 %10, i32* %arrayidx9, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %12, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx10, align 4, !dbg !170
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  call void @printWLine(i32* %arraydecay11), !dbg !172
  %13 = load i32*, i32** %data2, align 8, !dbg !173
  %14 = bitcast i32* %13 to i8*, !dbg !173
  call void @free(i8* %14) #6, !dbg !174
  ret void, !dbg !175
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_31_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 28, column: 23, scope: !16)
!24 = !DILocation(line: 28, column: 12, scope: !16)
!25 = !DILocation(line: 28, column: 10, scope: !16)
!26 = !DILocation(line: 29, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!28 = !DILocation(line: 29, column: 14, scope: !27)
!29 = !DILocation(line: 29, column: 9, scope: !16)
!30 = !DILocation(line: 29, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 29, column: 23)
!32 = !DILocation(line: 30, column: 13, scope: !16)
!33 = !DILocation(line: 30, column: 5, scope: !16)
!34 = !DILocation(line: 31, column: 5, scope: !16)
!35 = !DILocation(line: 31, column: 16, scope: !16)
!36 = !DILocalVariable(name: "dataCopy", scope: !37, file: !17, line: 33, type: !4)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 5)
!38 = !DILocation(line: 33, column: 19, scope: !37)
!39 = !DILocation(line: 33, column: 30, scope: !37)
!40 = !DILocalVariable(name: "data", scope: !37, file: !17, line: 34, type: !4)
!41 = !DILocation(line: 34, column: 19, scope: !37)
!42 = !DILocation(line: 34, column: 26, scope: !37)
!43 = !DILocalVariable(name: "i", scope: !44, file: !17, line: 36, type: !45)
!44 = distinct !DILexicalBlock(scope: !37, file: !17, line: 35, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 20, scope: !44)
!48 = !DILocalVariable(name: "destLen", scope: !44, file: !17, line: 36, type: !45)
!49 = !DILocation(line: 36, column: 23, scope: !44)
!50 = !DILocalVariable(name: "dest", scope: !44, file: !17, line: 37, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 37, column: 21, scope: !44)
!55 = !DILocation(line: 38, column: 21, scope: !44)
!56 = !DILocation(line: 38, column: 13, scope: !44)
!57 = !DILocation(line: 39, column: 13, scope: !44)
!58 = !DILocation(line: 39, column: 25, scope: !44)
!59 = !DILocation(line: 40, column: 30, scope: !44)
!60 = !DILocation(line: 40, column: 23, scope: !44)
!61 = !DILocation(line: 40, column: 21, scope: !44)
!62 = !DILocation(line: 43, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !44, file: !17, line: 43, column: 13)
!64 = !DILocation(line: 43, column: 18, scope: !63)
!65 = !DILocation(line: 43, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !17, line: 43, column: 13)
!67 = !DILocation(line: 43, column: 29, scope: !66)
!68 = !DILocation(line: 43, column: 27, scope: !66)
!69 = !DILocation(line: 43, column: 13, scope: !63)
!70 = !DILocation(line: 45, column: 27, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !17, line: 44, column: 13)
!72 = !DILocation(line: 45, column: 32, scope: !71)
!73 = !DILocation(line: 45, column: 22, scope: !71)
!74 = !DILocation(line: 45, column: 17, scope: !71)
!75 = !DILocation(line: 45, column: 25, scope: !71)
!76 = !DILocation(line: 46, column: 13, scope: !71)
!77 = !DILocation(line: 43, column: 39, scope: !66)
!78 = !DILocation(line: 43, column: 13, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 46, column: 13, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 47, column: 13, scope: !44)
!83 = !DILocation(line: 47, column: 25, scope: !44)
!84 = !DILocation(line: 48, column: 24, scope: !44)
!85 = !DILocation(line: 48, column: 13, scope: !44)
!86 = !DILocation(line: 49, column: 18, scope: !44)
!87 = !DILocation(line: 49, column: 13, scope: !44)
!88 = !DILocation(line: 52, column: 1, scope: !16)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_31_good", scope: !17, file: !17, line: 90, type: !18, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 92, column: 5, scope: !89)
!91 = !DILocation(line: 93, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 104, type: !93, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!7, !7, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !17, line: 104, type: !7)
!99 = !DILocation(line: 104, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !17, line: 104, type: !95)
!101 = !DILocation(line: 104, column: 27, scope: !92)
!102 = !DILocation(line: 107, column: 22, scope: !92)
!103 = !DILocation(line: 107, column: 12, scope: !92)
!104 = !DILocation(line: 107, column: 5, scope: !92)
!105 = !DILocation(line: 109, column: 5, scope: !92)
!106 = !DILocation(line: 110, column: 5, scope: !92)
!107 = !DILocation(line: 111, column: 5, scope: !92)
!108 = !DILocation(line: 114, column: 5, scope: !92)
!109 = !DILocation(line: 115, column: 5, scope: !92)
!110 = !DILocation(line: 116, column: 5, scope: !92)
!111 = !DILocation(line: 118, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 61, type: !4)
!114 = !DILocation(line: 61, column: 15, scope: !112)
!115 = !DILocation(line: 62, column: 10, scope: !112)
!116 = !DILocation(line: 64, column: 23, scope: !112)
!117 = !DILocation(line: 64, column: 12, scope: !112)
!118 = !DILocation(line: 64, column: 10, scope: !112)
!119 = !DILocation(line: 65, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !17, line: 65, column: 9)
!121 = !DILocation(line: 65, column: 14, scope: !120)
!122 = !DILocation(line: 65, column: 9, scope: !112)
!123 = !DILocation(line: 65, column: 24, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !17, line: 65, column: 23)
!125 = !DILocation(line: 66, column: 13, scope: !112)
!126 = !DILocation(line: 66, column: 5, scope: !112)
!127 = !DILocation(line: 67, column: 5, scope: !112)
!128 = !DILocation(line: 67, column: 17, scope: !112)
!129 = !DILocalVariable(name: "dataCopy", scope: !130, file: !17, line: 69, type: !4)
!130 = distinct !DILexicalBlock(scope: !112, file: !17, line: 68, column: 5)
!131 = !DILocation(line: 69, column: 19, scope: !130)
!132 = !DILocation(line: 69, column: 30, scope: !130)
!133 = !DILocalVariable(name: "data", scope: !130, file: !17, line: 70, type: !4)
!134 = !DILocation(line: 70, column: 19, scope: !130)
!135 = !DILocation(line: 70, column: 26, scope: !130)
!136 = !DILocalVariable(name: "i", scope: !137, file: !17, line: 72, type: !45)
!137 = distinct !DILexicalBlock(scope: !130, file: !17, line: 71, column: 9)
!138 = !DILocation(line: 72, column: 20, scope: !137)
!139 = !DILocalVariable(name: "destLen", scope: !137, file: !17, line: 72, type: !45)
!140 = !DILocation(line: 72, column: 23, scope: !137)
!141 = !DILocalVariable(name: "dest", scope: !137, file: !17, line: 73, type: !51)
!142 = !DILocation(line: 73, column: 21, scope: !137)
!143 = !DILocation(line: 74, column: 21, scope: !137)
!144 = !DILocation(line: 74, column: 13, scope: !137)
!145 = !DILocation(line: 75, column: 13, scope: !137)
!146 = !DILocation(line: 75, column: 25, scope: !137)
!147 = !DILocation(line: 76, column: 30, scope: !137)
!148 = !DILocation(line: 76, column: 23, scope: !137)
!149 = !DILocation(line: 76, column: 21, scope: !137)
!150 = !DILocation(line: 79, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !137, file: !17, line: 79, column: 13)
!152 = !DILocation(line: 79, column: 18, scope: !151)
!153 = !DILocation(line: 79, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !17, line: 79, column: 13)
!155 = !DILocation(line: 79, column: 29, scope: !154)
!156 = !DILocation(line: 79, column: 27, scope: !154)
!157 = !DILocation(line: 79, column: 13, scope: !151)
!158 = !DILocation(line: 81, column: 27, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !17, line: 80, column: 13)
!160 = !DILocation(line: 81, column: 32, scope: !159)
!161 = !DILocation(line: 81, column: 22, scope: !159)
!162 = !DILocation(line: 81, column: 17, scope: !159)
!163 = !DILocation(line: 81, column: 25, scope: !159)
!164 = !DILocation(line: 82, column: 13, scope: !159)
!165 = !DILocation(line: 79, column: 39, scope: !154)
!166 = !DILocation(line: 79, column: 13, scope: !154)
!167 = distinct !{!167, !157, !168, !81}
!168 = !DILocation(line: 82, column: 13, scope: !151)
!169 = !DILocation(line: 83, column: 13, scope: !137)
!170 = !DILocation(line: 83, column: 25, scope: !137)
!171 = !DILocation(line: 84, column: 24, scope: !137)
!172 = !DILocation(line: 84, column: 13, scope: !137)
!173 = !DILocation(line: 85, column: 18, scope: !137)
!174 = !DILocation(line: 85, column: 13, scope: !137)
!175 = !DILocation(line: 88, column: 1, scope: !112)
