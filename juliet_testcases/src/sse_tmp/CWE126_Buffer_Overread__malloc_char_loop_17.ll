; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %i2 = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i8* null, i8** %data, align 8, !dbg !23
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !26

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !27
  %cmp = icmp slt i32 %0, 1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !31
  store i8* %call, i8** %data, align 8, !dbg !33
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %cmp1 = icmp eq i8* %1, null, !dbg !36
  br i1 %cmp1, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %data, align 8, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  br label %for.inc, !dbg !44

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !45
  %inc = add nsw i32 %4, 1, !dbg !45
  store i32 %inc, i32* %i, align 4, !dbg !45
  br label %for.cond, !dbg !46, !llvm.loop !47

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !50, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !58, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !63
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !64
  store i8 0, i8* %arrayidx3, align 1, !dbg !65
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !66
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !67
  store i64 %call5, i64* %destLen, align 8, !dbg !68
  store i64 0, i64* %i2, align 8, !dbg !69
  br label %for.cond6, !dbg !71

for.cond6:                                        ; preds = %for.inc11, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !72
  %6 = load i64, i64* %destLen, align 8, !dbg !74
  %cmp7 = icmp ult i64 %5, %6, !dbg !75
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !76

for.body8:                                        ; preds = %for.cond6
  %7 = load i8*, i8** %data, align 8, !dbg !77
  %8 = load i64, i64* %i2, align 8, !dbg !79
  %arrayidx9 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !77
  %9 = load i8, i8* %arrayidx9, align 1, !dbg !77
  %10 = load i64, i64* %i2, align 8, !dbg !80
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !81
  store i8 %9, i8* %arrayidx10, align 1, !dbg !82
  br label %for.inc11, !dbg !83

for.inc11:                                        ; preds = %for.body8
  %11 = load i64, i64* %i2, align 8, !dbg !84
  %inc12 = add i64 %11, 1, !dbg !84
  store i64 %inc12, i64* %i2, align 8, !dbg !84
  br label %for.cond6, !dbg !85, !llvm.loop !86

for.end13:                                        ; preds = %for.cond6
  %arrayidx14 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx14, align 1, !dbg !89
  %arraydecay15 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !90
  call void @printLine(i8* %arraydecay15), !dbg !91
  %12 = load i8*, i8** %data, align 8, !dbg !92
  call void @free(i8* %12) #7, !dbg !93
  ret void, !dbg !94
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_17_good() #0 !dbg !95 {
entry:
  call void @goodG2B(), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !98 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* null) #7, !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 %conv) #7, !dbg !108
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__malloc_char_loop_17_good(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__malloc_char_loop_17_bad(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !116 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i8* null, i8** %data, align 8, !dbg !121
  store i32 0, i32* %h, align 4, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !125
  %cmp = icmp slt i32 %0, 1, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !129
  store i8* %call, i8** %data, align 8, !dbg !131
  %1 = load i8*, i8** %data, align 8, !dbg !132
  %cmp1 = icmp eq i8* %1, null, !dbg !134
  br i1 %cmp1, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %for.body
  %2 = load i8*, i8** %data, align 8, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !139
  %3 = load i8*, i8** %data, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !140
  store i8 0, i8* %arrayidx, align 1, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %h, align 4, !dbg !143
  %inc = add nsw i32 %4, 1, !dbg !143
  store i32 %inc, i32* %h, align 4, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !152, metadata !DIExpression()), !dbg !153
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !154
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !155
  store i8 0, i8* %arrayidx2, align 1, !dbg !156
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !158
  store i64 %call4, i64* %destLen, align 8, !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond5, !dbg !162

for.cond5:                                        ; preds = %for.inc10, %for.end
  %5 = load i64, i64* %i, align 8, !dbg !163
  %6 = load i64, i64* %destLen, align 8, !dbg !165
  %cmp6 = icmp ult i64 %5, %6, !dbg !166
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !167

for.body7:                                        ; preds = %for.cond5
  %7 = load i8*, i8** %data, align 8, !dbg !168
  %8 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx8 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !168
  %9 = load i8, i8* %arrayidx8, align 1, !dbg !168
  %10 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %10, !dbg !172
  store i8 %9, i8* %arrayidx9, align 1, !dbg !173
  br label %for.inc10, !dbg !174

for.inc10:                                        ; preds = %for.body7
  %11 = load i64, i64* %i, align 8, !dbg !175
  %inc11 = add i64 %11, 1, !dbg !175
  store i64 %inc11, i64* %i, align 8, !dbg !175
  br label %for.cond5, !dbg !176, !llvm.loop !177

for.end12:                                        ; preds = %for.cond5
  %arrayidx13 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !179
  store i8 0, i8* %arrayidx13, align 1, !dbg !180
  %arraydecay14 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !181
  call void @printLine(i8* %arraydecay14), !dbg !182
  %12 = load i8*, i8** %data, align 8, !dbg !183
  call void @free(i8* %12) #7, !dbg !184
  ret void, !dbg !185
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_17.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 25, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 9, scope: !14)
!21 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 12, scope: !14)
!23 = !DILocation(line: 27, column: 10, scope: !14)
!24 = !DILocation(line: 28, column: 11, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 28, column: 9, scope: !25)
!27 = !DILocation(line: 28, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 28, column: 5)
!29 = !DILocation(line: 28, column: 18, scope: !28)
!30 = !DILocation(line: 28, column: 5, scope: !25)
!31 = !DILocation(line: 31, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 5)
!33 = !DILocation(line: 31, column: 14, scope: !32)
!34 = !DILocation(line: 32, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !15, line: 32, column: 13)
!36 = !DILocation(line: 32, column: 18, scope: !35)
!37 = !DILocation(line: 32, column: 13, scope: !32)
!38 = !DILocation(line: 32, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 32, column: 27)
!40 = !DILocation(line: 33, column: 16, scope: !32)
!41 = !DILocation(line: 33, column: 9, scope: !32)
!42 = !DILocation(line: 34, column: 9, scope: !32)
!43 = !DILocation(line: 34, column: 20, scope: !32)
!44 = !DILocation(line: 35, column: 5, scope: !32)
!45 = !DILocation(line: 28, column: 24, scope: !28)
!46 = !DILocation(line: 28, column: 5, scope: !28)
!47 = distinct !{!47, !30, !48, !49}
!48 = !DILocation(line: 35, column: 5, scope: !25)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocalVariable(name: "i", scope: !51, file: !15, line: 37, type: !52)
!51 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 46, baseType: !54)
!53 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!54 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 37, column: 16, scope: !51)
!56 = !DILocalVariable(name: "destLen", scope: !51, file: !15, line: 37, type: !52)
!57 = !DILocation(line: 37, column: 19, scope: !51)
!58 = !DILocalVariable(name: "dest", scope: !51, file: !15, line: 38, type: !59)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 100)
!62 = !DILocation(line: 38, column: 14, scope: !51)
!63 = !DILocation(line: 39, column: 9, scope: !51)
!64 = !DILocation(line: 40, column: 9, scope: !51)
!65 = !DILocation(line: 40, column: 21, scope: !51)
!66 = !DILocation(line: 41, column: 26, scope: !51)
!67 = !DILocation(line: 41, column: 19, scope: !51)
!68 = !DILocation(line: 41, column: 17, scope: !51)
!69 = !DILocation(line: 44, column: 16, scope: !70)
!70 = distinct !DILexicalBlock(scope: !51, file: !15, line: 44, column: 9)
!71 = !DILocation(line: 44, column: 14, scope: !70)
!72 = !DILocation(line: 44, column: 21, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !15, line: 44, column: 9)
!74 = !DILocation(line: 44, column: 25, scope: !73)
!75 = !DILocation(line: 44, column: 23, scope: !73)
!76 = !DILocation(line: 44, column: 9, scope: !70)
!77 = !DILocation(line: 46, column: 23, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !15, line: 45, column: 9)
!79 = !DILocation(line: 46, column: 28, scope: !78)
!80 = !DILocation(line: 46, column: 18, scope: !78)
!81 = !DILocation(line: 46, column: 13, scope: !78)
!82 = !DILocation(line: 46, column: 21, scope: !78)
!83 = !DILocation(line: 47, column: 9, scope: !78)
!84 = !DILocation(line: 44, column: 35, scope: !73)
!85 = !DILocation(line: 44, column: 9, scope: !73)
!86 = distinct !{!86, !76, !87, !49}
!87 = !DILocation(line: 47, column: 9, scope: !70)
!88 = !DILocation(line: 48, column: 9, scope: !51)
!89 = !DILocation(line: 48, column: 21, scope: !51)
!90 = !DILocation(line: 49, column: 19, scope: !51)
!91 = !DILocation(line: 49, column: 9, scope: !51)
!92 = !DILocation(line: 50, column: 14, scope: !51)
!93 = !DILocation(line: 50, column: 9, scope: !51)
!94 = !DILocation(line: 52, column: 1, scope: !14)
!95 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_17_good", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 92, column: 5, scope: !95)
!97 = !DILocation(line: 93, column: 1, scope: !95)
!98 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !99, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DISubroutineType(types: !100)
!100 = !{!19, !19, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !98, file: !15, line: 105, type: !19)
!103 = !DILocation(line: 105, column: 14, scope: !98)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !98, file: !15, line: 105, type: !101)
!105 = !DILocation(line: 105, column: 27, scope: !98)
!106 = !DILocation(line: 108, column: 22, scope: !98)
!107 = !DILocation(line: 108, column: 12, scope: !98)
!108 = !DILocation(line: 108, column: 5, scope: !98)
!109 = !DILocation(line: 110, column: 5, scope: !98)
!110 = !DILocation(line: 111, column: 5, scope: !98)
!111 = !DILocation(line: 112, column: 5, scope: !98)
!112 = !DILocation(line: 115, column: 5, scope: !98)
!113 = !DILocation(line: 116, column: 5, scope: !98)
!114 = !DILocation(line: 117, column: 5, scope: !98)
!115 = !DILocation(line: 119, column: 5, scope: !98)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "h", scope: !116, file: !15, line: 61, type: !19)
!118 = !DILocation(line: 61, column: 9, scope: !116)
!119 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 62, type: !4)
!120 = !DILocation(line: 62, column: 12, scope: !116)
!121 = !DILocation(line: 63, column: 10, scope: !116)
!122 = !DILocation(line: 64, column: 11, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !15, line: 64, column: 5)
!124 = !DILocation(line: 64, column: 9, scope: !123)
!125 = !DILocation(line: 64, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !15, line: 64, column: 5)
!127 = !DILocation(line: 64, column: 18, scope: !126)
!128 = !DILocation(line: 64, column: 5, scope: !123)
!129 = !DILocation(line: 67, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 65, column: 5)
!131 = !DILocation(line: 67, column: 14, scope: !130)
!132 = !DILocation(line: 68, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !15, line: 68, column: 13)
!134 = !DILocation(line: 68, column: 18, scope: !133)
!135 = !DILocation(line: 68, column: 13, scope: !130)
!136 = !DILocation(line: 68, column: 28, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !15, line: 68, column: 27)
!138 = !DILocation(line: 69, column: 16, scope: !130)
!139 = !DILocation(line: 69, column: 9, scope: !130)
!140 = !DILocation(line: 70, column: 9, scope: !130)
!141 = !DILocation(line: 70, column: 21, scope: !130)
!142 = !DILocation(line: 71, column: 5, scope: !130)
!143 = !DILocation(line: 64, column: 24, scope: !126)
!144 = !DILocation(line: 64, column: 5, scope: !126)
!145 = distinct !{!145, !128, !146, !49}
!146 = !DILocation(line: 71, column: 5, scope: !123)
!147 = !DILocalVariable(name: "i", scope: !148, file: !15, line: 73, type: !52)
!148 = distinct !DILexicalBlock(scope: !116, file: !15, line: 72, column: 5)
!149 = !DILocation(line: 73, column: 16, scope: !148)
!150 = !DILocalVariable(name: "destLen", scope: !148, file: !15, line: 73, type: !52)
!151 = !DILocation(line: 73, column: 19, scope: !148)
!152 = !DILocalVariable(name: "dest", scope: !148, file: !15, line: 74, type: !59)
!153 = !DILocation(line: 74, column: 14, scope: !148)
!154 = !DILocation(line: 75, column: 9, scope: !148)
!155 = !DILocation(line: 76, column: 9, scope: !148)
!156 = !DILocation(line: 76, column: 21, scope: !148)
!157 = !DILocation(line: 77, column: 26, scope: !148)
!158 = !DILocation(line: 77, column: 19, scope: !148)
!159 = !DILocation(line: 77, column: 17, scope: !148)
!160 = !DILocation(line: 80, column: 16, scope: !161)
!161 = distinct !DILexicalBlock(scope: !148, file: !15, line: 80, column: 9)
!162 = !DILocation(line: 80, column: 14, scope: !161)
!163 = !DILocation(line: 80, column: 21, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !15, line: 80, column: 9)
!165 = !DILocation(line: 80, column: 25, scope: !164)
!166 = !DILocation(line: 80, column: 23, scope: !164)
!167 = !DILocation(line: 80, column: 9, scope: !161)
!168 = !DILocation(line: 82, column: 23, scope: !169)
!169 = distinct !DILexicalBlock(scope: !164, file: !15, line: 81, column: 9)
!170 = !DILocation(line: 82, column: 28, scope: !169)
!171 = !DILocation(line: 82, column: 18, scope: !169)
!172 = !DILocation(line: 82, column: 13, scope: !169)
!173 = !DILocation(line: 82, column: 21, scope: !169)
!174 = !DILocation(line: 83, column: 9, scope: !169)
!175 = !DILocation(line: 80, column: 35, scope: !164)
!176 = !DILocation(line: 80, column: 9, scope: !164)
!177 = distinct !{!177, !167, !178, !49}
!178 = !DILocation(line: 83, column: 9, scope: !161)
!179 = !DILocation(line: 84, column: 9, scope: !148)
!180 = !DILocation(line: 84, column: 21, scope: !148)
!181 = !DILocation(line: 85, column: 19, scope: !148)
!182 = !DILocation(line: 85, column: 9, scope: !148)
!183 = !DILocation(line: 86, column: 14, scope: !148)
!184 = !DILocation(line: 86, column: 9, scope: !148)
!185 = !DILocation(line: 88, column: 1, scope: !116)
