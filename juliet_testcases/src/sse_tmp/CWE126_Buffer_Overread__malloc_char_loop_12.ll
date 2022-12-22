; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_12_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end8, !dbg !37

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !38
  store i8* %call3, i8** %data, align 8, !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %cmp4 = icmp eq i8* %3, null, !dbg !43
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !44

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !45
  unreachable, !dbg !45

if.end6:                                          ; preds = %if.else
  %4 = load i8*, i8** %data, align 8, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !49
  store i8 0, i8* %arrayidx7, align 1, !dbg !50
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !59, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !64
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx9, align 1, !dbg !66
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  %call11 = call i64 @strlen(i8* %arraydecay10) #9, !dbg !68
  store i64 %call11, i64* %destLen, align 8, !dbg !69
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %if.end8
  %6 = load i64, i64* %i, align 8, !dbg !73
  %7 = load i64, i64* %destLen, align 8, !dbg !75
  %cmp12 = icmp ult i64 %6, %7, !dbg !76
  br i1 %cmp12, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !78
  %9 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx13 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !78
  %10 = load i8, i8* %arrayidx13, align 1, !dbg !78
  %11 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx14 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %11, !dbg !82
  store i8 %10, i8* %arrayidx14, align 1, !dbg !83
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !85
  %inc = add i64 %12, 1, !dbg !85
  store i64 %inc, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  %arrayidx15 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx15, align 1, !dbg !91
  %arraydecay16 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  call void @printLine(i8* %arraydecay16), !dbg !93
  %13 = load i8*, i8** %data, align 8, !dbg !94
  call void @free(i8* %13) #7, !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

declare dso_local void @printLine(i8*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_12_good() #0 !dbg !97 {
entry:
  call void @goodG2B(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !105, metadata !DIExpression()), !dbg !106
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i64 @time(i64* null) #7, !dbg !109
  %conv = trunc i64 %call to i32, !dbg !110
  call void @srand(i32 %conv) #7, !dbg !111
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__malloc_char_loop_12_good(), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !115
  call void @CWE126_Buffer_Overread__malloc_char_loop_12_bad(), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !117
  ret i32 0, !dbg !118
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !119 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !120, metadata !DIExpression()), !dbg !121
  store i8* null, i8** %data, align 8, !dbg !122
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !123
  %tobool = icmp ne i32 %call, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.else, !dbg !125

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !126
  store i8* %call1, i8** %data, align 8, !dbg !128
  %0 = load i8*, i8** %data, align 8, !dbg !129
  %cmp = icmp eq i8* %0, null, !dbg !131
  br i1 %cmp, label %if.then2, label %if.end, !dbg !132

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !136
  %2 = load i8*, i8** %data, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !138
  br label %if.end8, !dbg !139

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !140
  store i8* %call3, i8** %data, align 8, !dbg !142
  %3 = load i8*, i8** %data, align 8, !dbg !143
  %cmp4 = icmp eq i8* %3, null, !dbg !145
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !146

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !147
  unreachable, !dbg !147

if.end6:                                          ; preds = %if.else
  %4 = load i8*, i8** %data, align 8, !dbg !149
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !150
  %5 = load i8*, i8** %data, align 8, !dbg !151
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !151
  store i8 0, i8* %arrayidx7, align 1, !dbg !152
  br label %if.end8

if.end8:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !153, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !158, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !160
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !161
  store i8 0, i8* %arrayidx9, align 1, !dbg !162
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !163
  %call11 = call i64 @strlen(i8* %arraydecay10) #9, !dbg !164
  store i64 %call11, i64* %destLen, align 8, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %if.end8
  %6 = load i64, i64* %i, align 8, !dbg !169
  %7 = load i64, i64* %destLen, align 8, !dbg !171
  %cmp12 = icmp ult i64 %6, %7, !dbg !172
  br i1 %cmp12, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !174
  %9 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx13 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !174
  %10 = load i8, i8* %arrayidx13, align 1, !dbg !174
  %11 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx14 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %11, !dbg !178
  store i8 %10, i8* %arrayidx14, align 1, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %12, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %arrayidx15 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !185
  store i8 0, i8* %arrayidx15, align 1, !dbg !186
  %arraydecay16 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !187
  call void @printLine(i8* %arraydecay16), !dbg !188
  %13 = load i8*, i8** %data, align 8, !dbg !189
  call void @free(i8* %13) #7, !dbg !190
  ret void, !dbg !191
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_12.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_12_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_12.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!23 = !DILocation(line: 27, column: 8, scope: !14)
!24 = !DILocation(line: 30, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 28, column: 5)
!26 = !DILocation(line: 30, column: 14, scope: !25)
!27 = !DILocation(line: 31, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 31, column: 13)
!29 = !DILocation(line: 31, column: 18, scope: !28)
!30 = !DILocation(line: 31, column: 13, scope: !25)
!31 = !DILocation(line: 31, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 27)
!33 = !DILocation(line: 32, column: 16, scope: !25)
!34 = !DILocation(line: 32, column: 9, scope: !25)
!35 = !DILocation(line: 33, column: 9, scope: !25)
!36 = !DILocation(line: 33, column: 20, scope: !25)
!37 = !DILocation(line: 34, column: 5, scope: !25)
!38 = !DILocation(line: 38, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !22, file: !15, line: 36, column: 5)
!40 = !DILocation(line: 38, column: 14, scope: !39)
!41 = !DILocation(line: 39, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !15, line: 39, column: 13)
!43 = !DILocation(line: 39, column: 18, scope: !42)
!44 = !DILocation(line: 39, column: 13, scope: !39)
!45 = !DILocation(line: 39, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 39, column: 27)
!47 = !DILocation(line: 40, column: 16, scope: !39)
!48 = !DILocation(line: 40, column: 9, scope: !39)
!49 = !DILocation(line: 41, column: 9, scope: !39)
!50 = !DILocation(line: 41, column: 21, scope: !39)
!51 = !DILocalVariable(name: "i", scope: !52, file: !15, line: 44, type: !53)
!52 = distinct !DILexicalBlock(scope: !14, file: !15, line: 43, column: 5)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 44, column: 16, scope: !52)
!57 = !DILocalVariable(name: "destLen", scope: !52, file: !15, line: 44, type: !53)
!58 = !DILocation(line: 44, column: 19, scope: !52)
!59 = !DILocalVariable(name: "dest", scope: !52, file: !15, line: 45, type: !60)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 100)
!63 = !DILocation(line: 45, column: 14, scope: !52)
!64 = !DILocation(line: 46, column: 9, scope: !52)
!65 = !DILocation(line: 47, column: 9, scope: !52)
!66 = !DILocation(line: 47, column: 21, scope: !52)
!67 = !DILocation(line: 48, column: 26, scope: !52)
!68 = !DILocation(line: 48, column: 19, scope: !52)
!69 = !DILocation(line: 48, column: 17, scope: !52)
!70 = !DILocation(line: 51, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !52, file: !15, line: 51, column: 9)
!72 = !DILocation(line: 51, column: 14, scope: !71)
!73 = !DILocation(line: 51, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !15, line: 51, column: 9)
!75 = !DILocation(line: 51, column: 25, scope: !74)
!76 = !DILocation(line: 51, column: 23, scope: !74)
!77 = !DILocation(line: 51, column: 9, scope: !71)
!78 = !DILocation(line: 53, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !15, line: 52, column: 9)
!80 = !DILocation(line: 53, column: 28, scope: !79)
!81 = !DILocation(line: 53, column: 18, scope: !79)
!82 = !DILocation(line: 53, column: 13, scope: !79)
!83 = !DILocation(line: 53, column: 21, scope: !79)
!84 = !DILocation(line: 54, column: 9, scope: !79)
!85 = !DILocation(line: 51, column: 35, scope: !74)
!86 = !DILocation(line: 51, column: 9, scope: !74)
!87 = distinct !{!87, !77, !88, !89}
!88 = !DILocation(line: 54, column: 9, scope: !71)
!89 = !{!"llvm.loop.mustprogress"}
!90 = !DILocation(line: 55, column: 9, scope: !52)
!91 = !DILocation(line: 55, column: 21, scope: !52)
!92 = !DILocation(line: 56, column: 19, scope: !52)
!93 = !DILocation(line: 56, column: 9, scope: !52)
!94 = !DILocation(line: 57, column: 14, scope: !52)
!95 = !DILocation(line: 57, column: 9, scope: !52)
!96 = !DILocation(line: 59, column: 1, scope: !14)
!97 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_12_good", scope: !15, file: !15, line: 105, type: !16, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 107, column: 5, scope: !97)
!99 = !DILocation(line: 108, column: 1, scope: !97)
!100 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 120, type: !101, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !103, !104}
!103 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!105 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !15, line: 120, type: !103)
!106 = !DILocation(line: 120, column: 14, scope: !100)
!107 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !15, line: 120, type: !104)
!108 = !DILocation(line: 120, column: 27, scope: !100)
!109 = !DILocation(line: 123, column: 22, scope: !100)
!110 = !DILocation(line: 123, column: 12, scope: !100)
!111 = !DILocation(line: 123, column: 5, scope: !100)
!112 = !DILocation(line: 125, column: 5, scope: !100)
!113 = !DILocation(line: 126, column: 5, scope: !100)
!114 = !DILocation(line: 127, column: 5, scope: !100)
!115 = !DILocation(line: 130, column: 5, scope: !100)
!116 = !DILocation(line: 131, column: 5, scope: !100)
!117 = !DILocation(line: 132, column: 5, scope: !100)
!118 = !DILocation(line: 134, column: 5, scope: !100)
!119 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !16, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 69, type: !4)
!121 = !DILocation(line: 69, column: 12, scope: !119)
!122 = !DILocation(line: 70, column: 10, scope: !119)
!123 = !DILocation(line: 71, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !15, line: 71, column: 8)
!125 = !DILocation(line: 71, column: 8, scope: !119)
!126 = !DILocation(line: 74, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !15, line: 72, column: 5)
!128 = !DILocation(line: 74, column: 14, scope: !127)
!129 = !DILocation(line: 75, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !15, line: 75, column: 13)
!131 = !DILocation(line: 75, column: 18, scope: !130)
!132 = !DILocation(line: 75, column: 13, scope: !127)
!133 = !DILocation(line: 75, column: 28, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 75, column: 27)
!135 = !DILocation(line: 76, column: 16, scope: !127)
!136 = !DILocation(line: 76, column: 9, scope: !127)
!137 = !DILocation(line: 77, column: 9, scope: !127)
!138 = !DILocation(line: 77, column: 21, scope: !127)
!139 = !DILocation(line: 78, column: 5, scope: !127)
!140 = !DILocation(line: 82, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !124, file: !15, line: 80, column: 5)
!142 = !DILocation(line: 82, column: 14, scope: !141)
!143 = !DILocation(line: 83, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !15, line: 83, column: 13)
!145 = !DILocation(line: 83, column: 18, scope: !144)
!146 = !DILocation(line: 83, column: 13, scope: !141)
!147 = !DILocation(line: 83, column: 28, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !15, line: 83, column: 27)
!149 = !DILocation(line: 84, column: 16, scope: !141)
!150 = !DILocation(line: 84, column: 9, scope: !141)
!151 = !DILocation(line: 85, column: 9, scope: !141)
!152 = !DILocation(line: 85, column: 21, scope: !141)
!153 = !DILocalVariable(name: "i", scope: !154, file: !15, line: 88, type: !53)
!154 = distinct !DILexicalBlock(scope: !119, file: !15, line: 87, column: 5)
!155 = !DILocation(line: 88, column: 16, scope: !154)
!156 = !DILocalVariable(name: "destLen", scope: !154, file: !15, line: 88, type: !53)
!157 = !DILocation(line: 88, column: 19, scope: !154)
!158 = !DILocalVariable(name: "dest", scope: !154, file: !15, line: 89, type: !60)
!159 = !DILocation(line: 89, column: 14, scope: !154)
!160 = !DILocation(line: 90, column: 9, scope: !154)
!161 = !DILocation(line: 91, column: 9, scope: !154)
!162 = !DILocation(line: 91, column: 21, scope: !154)
!163 = !DILocation(line: 92, column: 26, scope: !154)
!164 = !DILocation(line: 92, column: 19, scope: !154)
!165 = !DILocation(line: 92, column: 17, scope: !154)
!166 = !DILocation(line: 95, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !154, file: !15, line: 95, column: 9)
!168 = !DILocation(line: 95, column: 14, scope: !167)
!169 = !DILocation(line: 95, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 95, column: 9)
!171 = !DILocation(line: 95, column: 25, scope: !170)
!172 = !DILocation(line: 95, column: 23, scope: !170)
!173 = !DILocation(line: 95, column: 9, scope: !167)
!174 = !DILocation(line: 97, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !15, line: 96, column: 9)
!176 = !DILocation(line: 97, column: 28, scope: !175)
!177 = !DILocation(line: 97, column: 18, scope: !175)
!178 = !DILocation(line: 97, column: 13, scope: !175)
!179 = !DILocation(line: 97, column: 21, scope: !175)
!180 = !DILocation(line: 98, column: 9, scope: !175)
!181 = !DILocation(line: 95, column: 35, scope: !170)
!182 = !DILocation(line: 95, column: 9, scope: !170)
!183 = distinct !{!183, !173, !184, !89}
!184 = !DILocation(line: 98, column: 9, scope: !167)
!185 = !DILocation(line: 99, column: 9, scope: !154)
!186 = !DILocation(line: 99, column: 21, scope: !154)
!187 = !DILocation(line: 100, column: 19, scope: !154)
!188 = !DILocation(line: 100, column: 9, scope: !154)
!189 = !DILocation(line: 101, column: 14, scope: !154)
!190 = !DILocation(line: 101, column: 9, scope: !154)
!191 = !DILocation(line: 103, column: 1, scope: !119)
