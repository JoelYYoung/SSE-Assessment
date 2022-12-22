; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_42.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !30, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !41
  store i64 %call2, i64* %destLen, align 8, !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !46
  %2 = load i64, i64* %destLen, align 8, !dbg !48
  %cmp = icmp ult i64 %1, %2, !dbg !49
  br i1 %cmp, label %for.body, label %for.end, !dbg !50

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !51
  %4 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !51
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !51
  %6 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !55
  store i8 %5, i8* %arrayidx4, align 1, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %7, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx5, align 1, !dbg !64
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  call void @printLine(i8* %arraydecay6), !dbg !66
  %8 = load i8*, i8** %data, align 8, !dbg !67
  call void @free(i8* %8) #8, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !70 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !75
  store i8* %call, i8** %data.addr, align 8, !dbg !76
  %0 = load i8*, i8** %data.addr, align 8, !dbg !77
  %cmp = icmp eq i8* %0, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !84
  %2 = load i8*, i8** %data.addr, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %3 = load i8*, i8** %data.addr, align 8, !dbg !87
  ret i8* %3, !dbg !88
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_42_good() #0 !dbg !89 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #8, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #8, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__malloc_char_loop_42_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__malloc_char_loop_42_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i8* null, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %call = call i8* @goodG2BSource(i8* %0), !dbg !116
  store i8* %call, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !128
  %call2 = call i64 @strlen(i8* %arraydecay1) #7, !dbg !129
  store i64 %call2, i64* %destLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !134
  %2 = load i64, i64* %destLen, align 8, !dbg !136
  %cmp = icmp ult i64 %1, %2, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !139
  %4 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !139
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !139
  %6 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !143
  store i8 %5, i8* %arrayidx4, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %7, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !150
  store i8 0, i8* %arrayidx5, align 1, !dbg !151
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !152
  call void @printLine(i8* %arraydecay6), !dbg !153
  %8 = load i8*, i8** %data, align 8, !dbg !154
  call void @free(i8* %8) #8, !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !157 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !158, metadata !DIExpression()), !dbg !159
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !160
  store i8* %call, i8** %data.addr, align 8, !dbg !161
  %0 = load i8*, i8** %data.addr, align 8, !dbg !162
  %cmp = icmp eq i8* %0, null, !dbg !164
  br i1 %cmp, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !166
  unreachable, !dbg !166

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !169
  %2 = load i8*, i8** %data.addr, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  %3 = load i8*, i8** %data.addr, align 8, !dbg !172
  ret i8* %3, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_42_bad", scope: !15, file: !15, line: 33, type: !16, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_42.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 35, type: !5)
!19 = !DILocation(line: 35, column: 12, scope: !14)
!20 = !DILocation(line: 36, column: 10, scope: !14)
!21 = !DILocation(line: 37, column: 22, scope: !14)
!22 = !DILocation(line: 37, column: 12, scope: !14)
!23 = !DILocation(line: 37, column: 10, scope: !14)
!24 = !DILocalVariable(name: "i", scope: !25, file: !15, line: 39, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 46, baseType: !28)
!27 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!28 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!29 = !DILocation(line: 39, column: 16, scope: !25)
!30 = !DILocalVariable(name: "destLen", scope: !25, file: !15, line: 39, type: !26)
!31 = !DILocation(line: 39, column: 19, scope: !25)
!32 = !DILocalVariable(name: "dest", scope: !25, file: !15, line: 40, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 40, column: 14, scope: !25)
!37 = !DILocation(line: 41, column: 9, scope: !25)
!38 = !DILocation(line: 42, column: 9, scope: !25)
!39 = !DILocation(line: 42, column: 21, scope: !25)
!40 = !DILocation(line: 43, column: 26, scope: !25)
!41 = !DILocation(line: 43, column: 19, scope: !25)
!42 = !DILocation(line: 43, column: 17, scope: !25)
!43 = !DILocation(line: 46, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !25, file: !15, line: 46, column: 9)
!45 = !DILocation(line: 46, column: 14, scope: !44)
!46 = !DILocation(line: 46, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !15, line: 46, column: 9)
!48 = !DILocation(line: 46, column: 25, scope: !47)
!49 = !DILocation(line: 46, column: 23, scope: !47)
!50 = !DILocation(line: 46, column: 9, scope: !44)
!51 = !DILocation(line: 48, column: 23, scope: !52)
!52 = distinct !DILexicalBlock(scope: !47, file: !15, line: 47, column: 9)
!53 = !DILocation(line: 48, column: 28, scope: !52)
!54 = !DILocation(line: 48, column: 18, scope: !52)
!55 = !DILocation(line: 48, column: 13, scope: !52)
!56 = !DILocation(line: 48, column: 21, scope: !52)
!57 = !DILocation(line: 49, column: 9, scope: !52)
!58 = !DILocation(line: 46, column: 35, scope: !47)
!59 = !DILocation(line: 46, column: 9, scope: !47)
!60 = distinct !{!60, !50, !61, !62}
!61 = !DILocation(line: 49, column: 9, scope: !44)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 50, column: 9, scope: !25)
!64 = !DILocation(line: 50, column: 21, scope: !25)
!65 = !DILocation(line: 51, column: 19, scope: !25)
!66 = !DILocation(line: 51, column: 9, scope: !25)
!67 = !DILocation(line: 52, column: 14, scope: !25)
!68 = !DILocation(line: 52, column: 9, scope: !25)
!69 = !DILocation(line: 54, column: 1, scope: !14)
!70 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !71, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!5, !5}
!73 = !DILocalVariable(name: "data", arg: 1, scope: !70, file: !15, line: 23, type: !5)
!74 = !DILocation(line: 23, column: 32, scope: !70)
!75 = !DILocation(line: 26, column: 20, scope: !70)
!76 = !DILocation(line: 26, column: 10, scope: !70)
!77 = !DILocation(line: 27, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !15, line: 27, column: 9)
!79 = !DILocation(line: 27, column: 14, scope: !78)
!80 = !DILocation(line: 27, column: 9, scope: !70)
!81 = !DILocation(line: 27, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 27, column: 23)
!83 = !DILocation(line: 28, column: 12, scope: !70)
!84 = !DILocation(line: 28, column: 5, scope: !70)
!85 = !DILocation(line: 29, column: 5, scope: !70)
!86 = !DILocation(line: 29, column: 16, scope: !70)
!87 = !DILocation(line: 30, column: 12, scope: !70)
!88 = !DILocation(line: 30, column: 5, scope: !70)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_42_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 96, column: 5, scope: !89)
!91 = !DILocation(line: 97, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 109, type: !93, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !95, !96}
!95 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !15, line: 109, type: !95)
!98 = !DILocation(line: 109, column: 14, scope: !92)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !15, line: 109, type: !96)
!100 = !DILocation(line: 109, column: 27, scope: !92)
!101 = !DILocation(line: 112, column: 22, scope: !92)
!102 = !DILocation(line: 112, column: 12, scope: !92)
!103 = !DILocation(line: 112, column: 5, scope: !92)
!104 = !DILocation(line: 114, column: 5, scope: !92)
!105 = !DILocation(line: 115, column: 5, scope: !92)
!106 = !DILocation(line: 116, column: 5, scope: !92)
!107 = !DILocation(line: 119, column: 5, scope: !92)
!108 = !DILocation(line: 120, column: 5, scope: !92)
!109 = !DILocation(line: 121, column: 5, scope: !92)
!110 = !DILocation(line: 123, column: 5, scope: !92)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !15, line: 73, type: !5)
!113 = !DILocation(line: 73, column: 12, scope: !111)
!114 = !DILocation(line: 74, column: 10, scope: !111)
!115 = !DILocation(line: 75, column: 26, scope: !111)
!116 = !DILocation(line: 75, column: 12, scope: !111)
!117 = !DILocation(line: 75, column: 10, scope: !111)
!118 = !DILocalVariable(name: "i", scope: !119, file: !15, line: 77, type: !26)
!119 = distinct !DILexicalBlock(scope: !111, file: !15, line: 76, column: 5)
!120 = !DILocation(line: 77, column: 16, scope: !119)
!121 = !DILocalVariable(name: "destLen", scope: !119, file: !15, line: 77, type: !26)
!122 = !DILocation(line: 77, column: 19, scope: !119)
!123 = !DILocalVariable(name: "dest", scope: !119, file: !15, line: 78, type: !33)
!124 = !DILocation(line: 78, column: 14, scope: !119)
!125 = !DILocation(line: 79, column: 9, scope: !119)
!126 = !DILocation(line: 80, column: 9, scope: !119)
!127 = !DILocation(line: 80, column: 21, scope: !119)
!128 = !DILocation(line: 81, column: 26, scope: !119)
!129 = !DILocation(line: 81, column: 19, scope: !119)
!130 = !DILocation(line: 81, column: 17, scope: !119)
!131 = !DILocation(line: 84, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !119, file: !15, line: 84, column: 9)
!133 = !DILocation(line: 84, column: 14, scope: !132)
!134 = !DILocation(line: 84, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !15, line: 84, column: 9)
!136 = !DILocation(line: 84, column: 25, scope: !135)
!137 = !DILocation(line: 84, column: 23, scope: !135)
!138 = !DILocation(line: 84, column: 9, scope: !132)
!139 = !DILocation(line: 86, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !15, line: 85, column: 9)
!141 = !DILocation(line: 86, column: 28, scope: !140)
!142 = !DILocation(line: 86, column: 18, scope: !140)
!143 = !DILocation(line: 86, column: 13, scope: !140)
!144 = !DILocation(line: 86, column: 21, scope: !140)
!145 = !DILocation(line: 87, column: 9, scope: !140)
!146 = !DILocation(line: 84, column: 35, scope: !135)
!147 = !DILocation(line: 84, column: 9, scope: !135)
!148 = distinct !{!148, !138, !149, !62}
!149 = !DILocation(line: 87, column: 9, scope: !132)
!150 = !DILocation(line: 88, column: 9, scope: !119)
!151 = !DILocation(line: 88, column: 21, scope: !119)
!152 = !DILocation(line: 89, column: 19, scope: !119)
!153 = !DILocation(line: 89, column: 9, scope: !119)
!154 = !DILocation(line: 90, column: 14, scope: !119)
!155 = !DILocation(line: 90, column: 9, scope: !119)
!156 = !DILocation(line: 92, column: 1, scope: !111)
!157 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 60, type: !71, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocalVariable(name: "data", arg: 1, scope: !157, file: !15, line: 60, type: !5)
!159 = !DILocation(line: 60, column: 36, scope: !157)
!160 = !DILocation(line: 63, column: 20, scope: !157)
!161 = !DILocation(line: 63, column: 10, scope: !157)
!162 = !DILocation(line: 64, column: 9, scope: !163)
!163 = distinct !DILexicalBlock(scope: !157, file: !15, line: 64, column: 9)
!164 = !DILocation(line: 64, column: 14, scope: !163)
!165 = !DILocation(line: 64, column: 9, scope: !157)
!166 = !DILocation(line: 64, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !15, line: 64, column: 23)
!168 = !DILocation(line: 65, column: 12, scope: !157)
!169 = !DILocation(line: 65, column: 5, scope: !157)
!170 = !DILocation(line: 66, column: 5, scope: !157)
!171 = !DILocation(line: 66, column: 17, scope: !157)
!172 = !DILocation(line: 67, column: 12, scope: !157)
!173 = !DILocation(line: 67, column: 5, scope: !157)
