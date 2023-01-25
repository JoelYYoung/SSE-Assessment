; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !31
  store i8* %call, i8** %data1, align 8, !dbg !32
  %2 = load i8*, i8** %data1, align 8, !dbg !33
  %cmp = icmp eq i8* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !40
  %4 = load i8*, i8** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %5 = load i8*, i8** %data1, align 8, !dbg !43
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !44
  store i8* %5, i8** %6, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !46, metadata !DIExpression()), !dbg !48
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !49
  %8 = load i8*, i8** %7, align 8, !dbg !50
  store i8* %8, i8** %data2, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !59, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !64
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx3, align 1, !dbg !66
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !68
  store i64 %call5, i64* %destLen, align 8, !dbg !69
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !73
  %10 = load i64, i64* %destLen, align 8, !dbg !75
  %cmp6 = icmp ult i64 %9, %10, !dbg !76
  br i1 %cmp6, label %for.body, label %for.end, !dbg !77

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data2, align 8, !dbg !78
  %12 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !78
  %13 = load i8, i8* %arrayidx7, align 1, !dbg !78
  %14 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %14, !dbg !82
  store i8 %13, i8* %arrayidx8, align 1, !dbg !83
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !85
  %inc = add i64 %15, 1, !dbg !85
  store i64 %inc, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx9, align 1, !dbg !91
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  call void @printLine(i8* %arraydecay10), !dbg !93
  %16 = load i8*, i8** %data2, align 8, !dbg !94
  call void @free(i8* %16) #7, !dbg !95
  ret void, !dbg !96
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
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_32_good() #0 !dbg !97 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !104, metadata !DIExpression()), !dbg !105
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i64 @time(i64* null) #7, !dbg !108
  %conv = trunc i64 %call to i32, !dbg !109
  call void @srand(i32 %conv) #7, !dbg !110
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__malloc_char_loop_32_good(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !113
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !114
  call void @CWE126_Buffer_Overread__malloc_char_loop_32_bad(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !116
  ret i32 0, !dbg !117
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !118 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !123, metadata !DIExpression()), !dbg !124
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !124
  store i8* null, i8** %data, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !126, metadata !DIExpression()), !dbg !128
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !129
  %1 = load i8*, i8** %0, align 8, !dbg !130
  store i8* %1, i8** %data1, align 8, !dbg !128
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !131
  store i8* %call, i8** %data1, align 8, !dbg !132
  %2 = load i8*, i8** %data1, align 8, !dbg !133
  %cmp = icmp eq i8* %2, null, !dbg !135
  br i1 %cmp, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !137
  unreachable, !dbg !137

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !140
  %4 = load i8*, i8** %data1, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !141
  store i8 0, i8* %arrayidx, align 1, !dbg !142
  %5 = load i8*, i8** %data1, align 8, !dbg !143
  %6 = load i8**, i8*** %dataPtr1, align 8, !dbg !144
  store i8* %5, i8** %6, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !146, metadata !DIExpression()), !dbg !148
  %7 = load i8**, i8*** %dataPtr2, align 8, !dbg !149
  %8 = load i8*, i8** %7, align 8, !dbg !150
  store i8* %8, i8** %data2, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !156, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !158
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !159
  store i8 0, i8* %arrayidx3, align 1, !dbg !160
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !161
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !162
  store i64 %call5, i64* %destLen, align 8, !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !167
  %10 = load i64, i64* %destLen, align 8, !dbg !169
  %cmp6 = icmp ult i64 %9, %10, !dbg !170
  br i1 %cmp6, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data2, align 8, !dbg !172
  %12 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx7 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !172
  %13 = load i8, i8* %arrayidx7, align 1, !dbg !172
  %14 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %14, !dbg !176
  store i8 %13, i8* %arrayidx8, align 1, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %15, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !183
  store i8 0, i8* %arrayidx9, align 1, !dbg !184
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !185
  call void @printLine(i8* %arraydecay10), !dbg !186
  %16 = load i8*, i8** %data2, align 8, !dbg !187
  call void @free(i8* %16) #7, !dbg !188
  ret void, !dbg !189
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 24, scope: !27)
!30 = !DILocation(line: 30, column: 23, scope: !27)
!31 = !DILocation(line: 32, column: 24, scope: !27)
!32 = !DILocation(line: 32, column: 14, scope: !27)
!33 = !DILocation(line: 33, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !15, line: 33, column: 13)
!35 = !DILocation(line: 33, column: 18, scope: !34)
!36 = !DILocation(line: 33, column: 13, scope: !27)
!37 = !DILocation(line: 33, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 33, column: 27)
!39 = !DILocation(line: 34, column: 16, scope: !27)
!40 = !DILocation(line: 34, column: 9, scope: !27)
!41 = !DILocation(line: 35, column: 9, scope: !27)
!42 = !DILocation(line: 35, column: 20, scope: !27)
!43 = !DILocation(line: 36, column: 21, scope: !27)
!44 = !DILocation(line: 36, column: 10, scope: !27)
!45 = !DILocation(line: 36, column: 19, scope: !27)
!46 = !DILocalVariable(name: "data", scope: !47, file: !15, line: 39, type: !4)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 16, scope: !47)
!49 = !DILocation(line: 39, column: 24, scope: !47)
!50 = !DILocation(line: 39, column: 23, scope: !47)
!51 = !DILocalVariable(name: "i", scope: !52, file: !15, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !15, line: 40, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 41, column: 20, scope: !52)
!57 = !DILocalVariable(name: "destLen", scope: !52, file: !15, line: 41, type: !53)
!58 = !DILocation(line: 41, column: 23, scope: !52)
!59 = !DILocalVariable(name: "dest", scope: !52, file: !15, line: 42, type: !60)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 100)
!63 = !DILocation(line: 42, column: 18, scope: !52)
!64 = !DILocation(line: 43, column: 13, scope: !52)
!65 = !DILocation(line: 44, column: 13, scope: !52)
!66 = !DILocation(line: 44, column: 25, scope: !52)
!67 = !DILocation(line: 45, column: 30, scope: !52)
!68 = !DILocation(line: 45, column: 23, scope: !52)
!69 = !DILocation(line: 45, column: 21, scope: !52)
!70 = !DILocation(line: 48, column: 20, scope: !71)
!71 = distinct !DILexicalBlock(scope: !52, file: !15, line: 48, column: 13)
!72 = !DILocation(line: 48, column: 18, scope: !71)
!73 = !DILocation(line: 48, column: 25, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !15, line: 48, column: 13)
!75 = !DILocation(line: 48, column: 29, scope: !74)
!76 = !DILocation(line: 48, column: 27, scope: !74)
!77 = !DILocation(line: 48, column: 13, scope: !71)
!78 = !DILocation(line: 50, column: 27, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !15, line: 49, column: 13)
!80 = !DILocation(line: 50, column: 32, scope: !79)
!81 = !DILocation(line: 50, column: 22, scope: !79)
!82 = !DILocation(line: 50, column: 17, scope: !79)
!83 = !DILocation(line: 50, column: 25, scope: !79)
!84 = !DILocation(line: 51, column: 13, scope: !79)
!85 = !DILocation(line: 48, column: 39, scope: !74)
!86 = !DILocation(line: 48, column: 13, scope: !74)
!87 = distinct !{!87, !77, !88, !89}
!88 = !DILocation(line: 51, column: 13, scope: !71)
!89 = !{!"llvm.loop.mustprogress"}
!90 = !DILocation(line: 52, column: 13, scope: !52)
!91 = !DILocation(line: 52, column: 25, scope: !52)
!92 = !DILocation(line: 53, column: 23, scope: !52)
!93 = !DILocation(line: 53, column: 13, scope: !52)
!94 = !DILocation(line: 54, column: 18, scope: !52)
!95 = !DILocation(line: 54, column: 13, scope: !52)
!96 = !DILocation(line: 57, column: 1, scope: !14)
!97 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_32_good", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 102, column: 5, scope: !97)
!99 = !DILocation(line: 103, column: 1, scope: !97)
!100 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 114, type: !101, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !103, !21}
!103 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !15, line: 114, type: !103)
!105 = !DILocation(line: 114, column: 14, scope: !100)
!106 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !15, line: 114, type: !21)
!107 = !DILocation(line: 114, column: 27, scope: !100)
!108 = !DILocation(line: 117, column: 22, scope: !100)
!109 = !DILocation(line: 117, column: 12, scope: !100)
!110 = !DILocation(line: 117, column: 5, scope: !100)
!111 = !DILocation(line: 119, column: 5, scope: !100)
!112 = !DILocation(line: 120, column: 5, scope: !100)
!113 = !DILocation(line: 121, column: 5, scope: !100)
!114 = !DILocation(line: 124, column: 5, scope: !100)
!115 = !DILocation(line: 125, column: 5, scope: !100)
!116 = !DILocation(line: 126, column: 5, scope: !100)
!117 = !DILocation(line: 128, column: 5, scope: !100)
!118 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 64, type: !16, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !15, line: 66, type: !4)
!120 = !DILocation(line: 66, column: 12, scope: !118)
!121 = !DILocalVariable(name: "dataPtr1", scope: !118, file: !15, line: 67, type: !21)
!122 = !DILocation(line: 67, column: 13, scope: !118)
!123 = !DILocalVariable(name: "dataPtr2", scope: !118, file: !15, line: 68, type: !21)
!124 = !DILocation(line: 68, column: 13, scope: !118)
!125 = !DILocation(line: 69, column: 10, scope: !118)
!126 = !DILocalVariable(name: "data", scope: !127, file: !15, line: 71, type: !4)
!127 = distinct !DILexicalBlock(scope: !118, file: !15, line: 70, column: 5)
!128 = !DILocation(line: 71, column: 16, scope: !127)
!129 = !DILocation(line: 71, column: 24, scope: !127)
!130 = !DILocation(line: 71, column: 23, scope: !127)
!131 = !DILocation(line: 73, column: 24, scope: !127)
!132 = !DILocation(line: 73, column: 14, scope: !127)
!133 = !DILocation(line: 74, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !15, line: 74, column: 13)
!135 = !DILocation(line: 74, column: 18, scope: !134)
!136 = !DILocation(line: 74, column: 13, scope: !127)
!137 = !DILocation(line: 74, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !15, line: 74, column: 27)
!139 = !DILocation(line: 75, column: 16, scope: !127)
!140 = !DILocation(line: 75, column: 9, scope: !127)
!141 = !DILocation(line: 76, column: 9, scope: !127)
!142 = !DILocation(line: 76, column: 21, scope: !127)
!143 = !DILocation(line: 77, column: 21, scope: !127)
!144 = !DILocation(line: 77, column: 10, scope: !127)
!145 = !DILocation(line: 77, column: 19, scope: !127)
!146 = !DILocalVariable(name: "data", scope: !147, file: !15, line: 80, type: !4)
!147 = distinct !DILexicalBlock(scope: !118, file: !15, line: 79, column: 5)
!148 = !DILocation(line: 80, column: 16, scope: !147)
!149 = !DILocation(line: 80, column: 24, scope: !147)
!150 = !DILocation(line: 80, column: 23, scope: !147)
!151 = !DILocalVariable(name: "i", scope: !152, file: !15, line: 82, type: !53)
!152 = distinct !DILexicalBlock(scope: !147, file: !15, line: 81, column: 9)
!153 = !DILocation(line: 82, column: 20, scope: !152)
!154 = !DILocalVariable(name: "destLen", scope: !152, file: !15, line: 82, type: !53)
!155 = !DILocation(line: 82, column: 23, scope: !152)
!156 = !DILocalVariable(name: "dest", scope: !152, file: !15, line: 83, type: !60)
!157 = !DILocation(line: 83, column: 18, scope: !152)
!158 = !DILocation(line: 84, column: 13, scope: !152)
!159 = !DILocation(line: 85, column: 13, scope: !152)
!160 = !DILocation(line: 85, column: 25, scope: !152)
!161 = !DILocation(line: 86, column: 30, scope: !152)
!162 = !DILocation(line: 86, column: 23, scope: !152)
!163 = !DILocation(line: 86, column: 21, scope: !152)
!164 = !DILocation(line: 89, column: 20, scope: !165)
!165 = distinct !DILexicalBlock(scope: !152, file: !15, line: 89, column: 13)
!166 = !DILocation(line: 89, column: 18, scope: !165)
!167 = !DILocation(line: 89, column: 25, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !15, line: 89, column: 13)
!169 = !DILocation(line: 89, column: 29, scope: !168)
!170 = !DILocation(line: 89, column: 27, scope: !168)
!171 = !DILocation(line: 89, column: 13, scope: !165)
!172 = !DILocation(line: 91, column: 27, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !15, line: 90, column: 13)
!174 = !DILocation(line: 91, column: 32, scope: !173)
!175 = !DILocation(line: 91, column: 22, scope: !173)
!176 = !DILocation(line: 91, column: 17, scope: !173)
!177 = !DILocation(line: 91, column: 25, scope: !173)
!178 = !DILocation(line: 92, column: 13, scope: !173)
!179 = !DILocation(line: 89, column: 39, scope: !168)
!180 = !DILocation(line: 89, column: 13, scope: !168)
!181 = distinct !{!181, !171, !182, !89}
!182 = !DILocation(line: 92, column: 13, scope: !165)
!183 = !DILocation(line: 93, column: 13, scope: !152)
!184 = !DILocation(line: 93, column: 25, scope: !152)
!185 = !DILocation(line: 94, column: 23, scope: !152)
!186 = !DILocation(line: 94, column: 13, scope: !152)
!187 = !DILocation(line: 95, column: 18, scope: !152)
!188 = !DILocation(line: 95, column: 13, scope: !152)
!189 = !DILocation(line: 98, column: 1, scope: !118)
