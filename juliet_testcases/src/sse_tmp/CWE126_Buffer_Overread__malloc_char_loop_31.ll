; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_31.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !30
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %3 = load i8*, i8** %data, align 8, !dbg !36
  store i8* %3, i8** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !37, metadata !DIExpression()), !dbg !38
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !39
  store i8* %4, i8** %data1, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx2, align 1, !dbg !55
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !57
  store i64 %call4, i64* %destLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !62
  %6 = load i64, i64* %destLen, align 8, !dbg !64
  %cmp5 = icmp ult i64 %5, %6, !dbg !65
  br i1 %cmp5, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data1, align 8, !dbg !67
  %8 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !67
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !67
  %10 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !71
  store i8 %9, i8* %arrayidx7, align 1, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %11, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx8, align 1, !dbg !80
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !81
  call void @printLine(i8* %arraydecay9), !dbg !82
  %12 = load i8*, i8** %data1, align 8, !dbg !83
  call void @free(i8* %12) #7, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_31_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #7, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #7, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE126_Buffer_Overread__malloc_char_loop_31_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_char_loop_31_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  store i8* null, i8** %data, align 8, !dbg !111
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !112
  store i8* %call, i8** %data, align 8, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %cmp = icmp eq i8* %0, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !121
  %2 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !124, metadata !DIExpression()), !dbg !126
  %3 = load i8*, i8** %data, align 8, !dbg !127
  store i8* %3, i8** %dataCopy, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !128, metadata !DIExpression()), !dbg !129
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !130
  store i8* %4, i8** %data1, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !138
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx2, align 1, !dbg !140
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !142
  store i64 %call4, i64* %destLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !147
  %6 = load i64, i64* %destLen, align 8, !dbg !149
  %cmp5 = icmp ult i64 %5, %6, !dbg !150
  br i1 %cmp5, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %7 = load i8*, i8** %data1, align 8, !dbg !152
  %8 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx6 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !152
  %9 = load i8, i8* %arrayidx6, align 1, !dbg !152
  %10 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !156
  store i8 %9, i8* %arrayidx7, align 1, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %11, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !163
  store i8 0, i8* %arrayidx8, align 1, !dbg !164
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !165
  call void @printLine(i8* %arraydecay9), !dbg !166
  %12 = load i8*, i8** %data1, align 8, !dbg !167
  call void @free(i8* %12) #7, !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 20, scope: !14)
!22 = !DILocation(line: 28, column: 10, scope: !14)
!23 = !DILocation(line: 29, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!25 = !DILocation(line: 29, column: 14, scope: !24)
!26 = !DILocation(line: 29, column: 9, scope: !14)
!27 = !DILocation(line: 29, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 23)
!29 = !DILocation(line: 30, column: 12, scope: !14)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 31, column: 5, scope: !14)
!32 = !DILocation(line: 31, column: 16, scope: !14)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !15, line: 33, type: !4)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!35 = !DILocation(line: 33, column: 16, scope: !34)
!36 = !DILocation(line: 33, column: 27, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 34, type: !4)
!38 = !DILocation(line: 34, column: 16, scope: !34)
!39 = !DILocation(line: 34, column: 23, scope: !34)
!40 = !DILocalVariable(name: "i", scope: !41, file: !15, line: 36, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !15, line: 35, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 20, scope: !41)
!46 = !DILocalVariable(name: "destLen", scope: !41, file: !15, line: 36, type: !42)
!47 = !DILocation(line: 36, column: 23, scope: !41)
!48 = !DILocalVariable(name: "dest", scope: !41, file: !15, line: 37, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 37, column: 18, scope: !41)
!53 = !DILocation(line: 38, column: 13, scope: !41)
!54 = !DILocation(line: 39, column: 13, scope: !41)
!55 = !DILocation(line: 39, column: 25, scope: !41)
!56 = !DILocation(line: 40, column: 30, scope: !41)
!57 = !DILocation(line: 40, column: 23, scope: !41)
!58 = !DILocation(line: 40, column: 21, scope: !41)
!59 = !DILocation(line: 43, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !41, file: !15, line: 43, column: 13)
!61 = !DILocation(line: 43, column: 18, scope: !60)
!62 = !DILocation(line: 43, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 43, column: 13)
!64 = !DILocation(line: 43, column: 29, scope: !63)
!65 = !DILocation(line: 43, column: 27, scope: !63)
!66 = !DILocation(line: 43, column: 13, scope: !60)
!67 = !DILocation(line: 45, column: 27, scope: !68)
!68 = distinct !DILexicalBlock(scope: !63, file: !15, line: 44, column: 13)
!69 = !DILocation(line: 45, column: 32, scope: !68)
!70 = !DILocation(line: 45, column: 22, scope: !68)
!71 = !DILocation(line: 45, column: 17, scope: !68)
!72 = !DILocation(line: 45, column: 25, scope: !68)
!73 = !DILocation(line: 46, column: 13, scope: !68)
!74 = !DILocation(line: 43, column: 39, scope: !63)
!75 = !DILocation(line: 43, column: 13, scope: !63)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 46, column: 13, scope: !60)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 47, column: 13, scope: !41)
!80 = !DILocation(line: 47, column: 25, scope: !41)
!81 = !DILocation(line: 48, column: 23, scope: !41)
!82 = !DILocation(line: 48, column: 13, scope: !41)
!83 = !DILocation(line: 49, column: 18, scope: !41)
!84 = !DILocation(line: 49, column: 13, scope: !41)
!85 = !DILocation(line: 52, column: 1, scope: !14)
!86 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_31_good", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocation(line: 92, column: 5, scope: !86)
!88 = !DILocation(line: 93, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !90, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !93}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !15, line: 104, type: !92)
!95 = !DILocation(line: 104, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !15, line: 104, type: !93)
!97 = !DILocation(line: 104, column: 27, scope: !89)
!98 = !DILocation(line: 107, column: 22, scope: !89)
!99 = !DILocation(line: 107, column: 12, scope: !89)
!100 = !DILocation(line: 107, column: 5, scope: !89)
!101 = !DILocation(line: 109, column: 5, scope: !89)
!102 = !DILocation(line: 110, column: 5, scope: !89)
!103 = !DILocation(line: 111, column: 5, scope: !89)
!104 = !DILocation(line: 114, column: 5, scope: !89)
!105 = !DILocation(line: 115, column: 5, scope: !89)
!106 = !DILocation(line: 116, column: 5, scope: !89)
!107 = !DILocation(line: 118, column: 5, scope: !89)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 61, type: !4)
!110 = !DILocation(line: 61, column: 12, scope: !108)
!111 = !DILocation(line: 62, column: 10, scope: !108)
!112 = !DILocation(line: 64, column: 20, scope: !108)
!113 = !DILocation(line: 64, column: 10, scope: !108)
!114 = !DILocation(line: 65, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !15, line: 65, column: 9)
!116 = !DILocation(line: 65, column: 14, scope: !115)
!117 = !DILocation(line: 65, column: 9, scope: !108)
!118 = !DILocation(line: 65, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 65, column: 23)
!120 = !DILocation(line: 66, column: 12, scope: !108)
!121 = !DILocation(line: 66, column: 5, scope: !108)
!122 = !DILocation(line: 67, column: 5, scope: !108)
!123 = !DILocation(line: 67, column: 17, scope: !108)
!124 = !DILocalVariable(name: "dataCopy", scope: !125, file: !15, line: 69, type: !4)
!125 = distinct !DILexicalBlock(scope: !108, file: !15, line: 68, column: 5)
!126 = !DILocation(line: 69, column: 16, scope: !125)
!127 = !DILocation(line: 69, column: 27, scope: !125)
!128 = !DILocalVariable(name: "data", scope: !125, file: !15, line: 70, type: !4)
!129 = !DILocation(line: 70, column: 16, scope: !125)
!130 = !DILocation(line: 70, column: 23, scope: !125)
!131 = !DILocalVariable(name: "i", scope: !132, file: !15, line: 72, type: !42)
!132 = distinct !DILexicalBlock(scope: !125, file: !15, line: 71, column: 9)
!133 = !DILocation(line: 72, column: 20, scope: !132)
!134 = !DILocalVariable(name: "destLen", scope: !132, file: !15, line: 72, type: !42)
!135 = !DILocation(line: 72, column: 23, scope: !132)
!136 = !DILocalVariable(name: "dest", scope: !132, file: !15, line: 73, type: !49)
!137 = !DILocation(line: 73, column: 18, scope: !132)
!138 = !DILocation(line: 74, column: 13, scope: !132)
!139 = !DILocation(line: 75, column: 13, scope: !132)
!140 = !DILocation(line: 75, column: 25, scope: !132)
!141 = !DILocation(line: 76, column: 30, scope: !132)
!142 = !DILocation(line: 76, column: 23, scope: !132)
!143 = !DILocation(line: 76, column: 21, scope: !132)
!144 = !DILocation(line: 79, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !132, file: !15, line: 79, column: 13)
!146 = !DILocation(line: 79, column: 18, scope: !145)
!147 = !DILocation(line: 79, column: 25, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !15, line: 79, column: 13)
!149 = !DILocation(line: 79, column: 29, scope: !148)
!150 = !DILocation(line: 79, column: 27, scope: !148)
!151 = !DILocation(line: 79, column: 13, scope: !145)
!152 = !DILocation(line: 81, column: 27, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !15, line: 80, column: 13)
!154 = !DILocation(line: 81, column: 32, scope: !153)
!155 = !DILocation(line: 81, column: 22, scope: !153)
!156 = !DILocation(line: 81, column: 17, scope: !153)
!157 = !DILocation(line: 81, column: 25, scope: !153)
!158 = !DILocation(line: 82, column: 13, scope: !153)
!159 = !DILocation(line: 79, column: 39, scope: !148)
!160 = !DILocation(line: 79, column: 13, scope: !148)
!161 = distinct !{!161, !151, !162, !78}
!162 = !DILocation(line: 82, column: 13, scope: !145)
!163 = !DILocation(line: 83, column: 13, scope: !132)
!164 = !DILocation(line: 83, column: 25, scope: !132)
!165 = !DILocation(line: 84, column: 23, scope: !132)
!166 = !DILocation(line: 84, column: 13, scope: !132)
!167 = !DILocation(line: 85, column: 18, scope: !132)
!168 = !DILocation(line: 85, column: 13, scope: !132)
!169 = !DILocation(line: 88, column: 1, scope: !108)
