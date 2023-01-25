; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !20, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !36
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !37
  store i64 %call, i64* %destLen, align 8, !dbg !38
  store i64 0, i64* %i, align 8, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !42
  %1 = load i64, i64* %destLen, align 8, !dbg !44
  %cmp = icmp ult i64 %0, %1, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !47
  %3 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !47
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !47
  %5 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !51
  store i8 %4, i8* %arrayidx3, align 1, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %6, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !59
  store i8 0, i8* %arrayidx4, align 1, !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay5), !dbg !62
  %7 = load i8*, i8** %data.addr, align 8, !dbg !63
  call void @free(i8* %7) #8, !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_41_bad() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  store i8* null, i8** %data, align 8, !dbg !71
  %call = call noalias align 16 i8* @malloc(i64 50) #8, !dbg !72
  store i8* %call, i8** %data, align 8, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  %cmp = icmp eq i8* %0, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !81
  %2 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !84
  call void @CWE126_Buffer_Overread__malloc_char_loop_41_badSink(i8* %3), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_41_goodG2BSink(i8* %data) #0 !dbg !87 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !97
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !101
  store i64 %call, i64* %destLen, align 8, !dbg !102
  store i64 0, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !106
  %1 = load i64, i64* %destLen, align 8, !dbg !108
  %cmp = icmp ult i64 %0, %1, !dbg !109
  br i1 %cmp, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !111
  %3 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !111
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !111
  %5 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !115
  store i8 %4, i8* %arrayidx3, align 1, !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !118
  %inc = add i64 %6, 1, !dbg !118
  store i64 %inc, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx4, align 1, !dbg !123
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay5), !dbg !125
  %7 = load i8*, i8** %data.addr, align 8, !dbg !126
  call void @free(i8* %7) #8, !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_char_loop_41_good() #0 !dbg !129 {
entry:
  call void @goodG2B(), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !132 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !137, metadata !DIExpression()), !dbg !138
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !139, metadata !DIExpression()), !dbg !140
  %call = call i64 @time(i64* null) #8, !dbg !141
  %conv = trunc i64 %call to i32, !dbg !142
  call void @srand(i32 %conv) #8, !dbg !143
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !144
  call void @CWE126_Buffer_Overread__malloc_char_loop_41_good(), !dbg !145
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !146
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !147
  call void @CWE126_Buffer_Overread__malloc_char_loop_41_bad(), !dbg !148
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !149
  ret i32 0, !dbg !150
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i8* null, i8** %data, align 8, !dbg !154
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !155
  store i8* %call, i8** %data, align 8, !dbg !156
  %0 = load i8*, i8** %data, align 8, !dbg !157
  %cmp = icmp eq i8* %0, null, !dbg !159
  br i1 %cmp, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !161
  unreachable, !dbg !161

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !163
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !164
  %2 = load i8*, i8** %data, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  %3 = load i8*, i8** %data, align 8, !dbg !167
  call void @CWE126_Buffer_Overread__malloc_char_loop_41_goodG2BSink(i8* %3), !dbg !168
  ret void, !dbg !169
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_char_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 65, scope: !14)
!20 = !DILocalVariable(name: "i", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !23, line: 46, baseType: !24)
!23 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 26, column: 16, scope: !21)
!26 = !DILocalVariable(name: "destLen", scope: !21, file: !15, line: 26, type: !22)
!27 = !DILocation(line: 26, column: 19, scope: !21)
!28 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 27, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 27, column: 14, scope: !21)
!33 = !DILocation(line: 28, column: 9, scope: !21)
!34 = !DILocation(line: 29, column: 9, scope: !21)
!35 = !DILocation(line: 29, column: 21, scope: !21)
!36 = !DILocation(line: 30, column: 26, scope: !21)
!37 = !DILocation(line: 30, column: 19, scope: !21)
!38 = !DILocation(line: 30, column: 17, scope: !21)
!39 = !DILocation(line: 33, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !21, file: !15, line: 33, column: 9)
!41 = !DILocation(line: 33, column: 14, scope: !40)
!42 = !DILocation(line: 33, column: 21, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !15, line: 33, column: 9)
!44 = !DILocation(line: 33, column: 25, scope: !43)
!45 = !DILocation(line: 33, column: 23, scope: !43)
!46 = !DILocation(line: 33, column: 9, scope: !40)
!47 = !DILocation(line: 35, column: 23, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !15, line: 34, column: 9)
!49 = !DILocation(line: 35, column: 28, scope: !48)
!50 = !DILocation(line: 35, column: 18, scope: !48)
!51 = !DILocation(line: 35, column: 13, scope: !48)
!52 = !DILocation(line: 35, column: 21, scope: !48)
!53 = !DILocation(line: 36, column: 9, scope: !48)
!54 = !DILocation(line: 33, column: 35, scope: !43)
!55 = !DILocation(line: 33, column: 9, scope: !43)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 36, column: 9, scope: !40)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 37, column: 9, scope: !21)
!60 = !DILocation(line: 37, column: 21, scope: !21)
!61 = !DILocation(line: 38, column: 19, scope: !21)
!62 = !DILocation(line: 38, column: 9, scope: !21)
!63 = !DILocation(line: 39, column: 14, scope: !21)
!64 = !DILocation(line: 39, column: 9, scope: !21)
!65 = !DILocation(line: 41, column: 1, scope: !14)
!66 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_41_bad", scope: !15, file: !15, line: 43, type: !67, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !DILocalVariable(name: "data", scope: !66, file: !15, line: 45, type: !4)
!70 = !DILocation(line: 45, column: 12, scope: !66)
!71 = !DILocation(line: 46, column: 10, scope: !66)
!72 = !DILocation(line: 48, column: 20, scope: !66)
!73 = !DILocation(line: 48, column: 10, scope: !66)
!74 = !DILocation(line: 49, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !66, file: !15, line: 49, column: 9)
!76 = !DILocation(line: 49, column: 14, scope: !75)
!77 = !DILocation(line: 49, column: 9, scope: !66)
!78 = !DILocation(line: 49, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 49, column: 23)
!80 = !DILocation(line: 50, column: 12, scope: !66)
!81 = !DILocation(line: 50, column: 5, scope: !66)
!82 = !DILocation(line: 51, column: 5, scope: !66)
!83 = !DILocation(line: 51, column: 16, scope: !66)
!84 = !DILocation(line: 52, column: 57, scope: !66)
!85 = !DILocation(line: 52, column: 5, scope: !66)
!86 = !DILocation(line: 53, column: 1, scope: !66)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_41_goodG2BSink", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", arg: 1, scope: !87, file: !15, line: 59, type: !4)
!89 = !DILocation(line: 59, column: 69, scope: !87)
!90 = !DILocalVariable(name: "i", scope: !91, file: !15, line: 62, type: !22)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 61, column: 5)
!92 = !DILocation(line: 62, column: 16, scope: !91)
!93 = !DILocalVariable(name: "destLen", scope: !91, file: !15, line: 62, type: !22)
!94 = !DILocation(line: 62, column: 19, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !91, file: !15, line: 63, type: !29)
!96 = !DILocation(line: 63, column: 14, scope: !91)
!97 = !DILocation(line: 64, column: 9, scope: !91)
!98 = !DILocation(line: 65, column: 9, scope: !91)
!99 = !DILocation(line: 65, column: 21, scope: !91)
!100 = !DILocation(line: 66, column: 26, scope: !91)
!101 = !DILocation(line: 66, column: 19, scope: !91)
!102 = !DILocation(line: 66, column: 17, scope: !91)
!103 = !DILocation(line: 69, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !91, file: !15, line: 69, column: 9)
!105 = !DILocation(line: 69, column: 14, scope: !104)
!106 = !DILocation(line: 69, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !15, line: 69, column: 9)
!108 = !DILocation(line: 69, column: 25, scope: !107)
!109 = !DILocation(line: 69, column: 23, scope: !107)
!110 = !DILocation(line: 69, column: 9, scope: !104)
!111 = !DILocation(line: 71, column: 23, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 70, column: 9)
!113 = !DILocation(line: 71, column: 28, scope: !112)
!114 = !DILocation(line: 71, column: 18, scope: !112)
!115 = !DILocation(line: 71, column: 13, scope: !112)
!116 = !DILocation(line: 71, column: 21, scope: !112)
!117 = !DILocation(line: 72, column: 9, scope: !112)
!118 = !DILocation(line: 69, column: 35, scope: !107)
!119 = !DILocation(line: 69, column: 9, scope: !107)
!120 = distinct !{!120, !110, !121, !58}
!121 = !DILocation(line: 72, column: 9, scope: !104)
!122 = !DILocation(line: 73, column: 9, scope: !91)
!123 = !DILocation(line: 73, column: 21, scope: !91)
!124 = !DILocation(line: 74, column: 19, scope: !91)
!125 = !DILocation(line: 74, column: 9, scope: !91)
!126 = !DILocation(line: 75, column: 14, scope: !91)
!127 = !DILocation(line: 75, column: 9, scope: !91)
!128 = !DILocation(line: 77, column: 1, scope: !87)
!129 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_loop_41_good", scope: !15, file: !15, line: 92, type: !67, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DILocation(line: 94, column: 5, scope: !129)
!131 = !DILocation(line: 95, column: 1, scope: !129)
!132 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 107, type: !133, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!133 = !DISubroutineType(types: !134)
!134 = !{!135, !135, !136}
!135 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!137 = !DILocalVariable(name: "argc", arg: 1, scope: !132, file: !15, line: 107, type: !135)
!138 = !DILocation(line: 107, column: 14, scope: !132)
!139 = !DILocalVariable(name: "argv", arg: 2, scope: !132, file: !15, line: 107, type: !136)
!140 = !DILocation(line: 107, column: 27, scope: !132)
!141 = !DILocation(line: 110, column: 22, scope: !132)
!142 = !DILocation(line: 110, column: 12, scope: !132)
!143 = !DILocation(line: 110, column: 5, scope: !132)
!144 = !DILocation(line: 112, column: 5, scope: !132)
!145 = !DILocation(line: 113, column: 5, scope: !132)
!146 = !DILocation(line: 114, column: 5, scope: !132)
!147 = !DILocation(line: 117, column: 5, scope: !132)
!148 = !DILocation(line: 118, column: 5, scope: !132)
!149 = !DILocation(line: 119, column: 5, scope: !132)
!150 = !DILocation(line: 121, column: 5, scope: !132)
!151 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 80, type: !67, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !15, line: 82, type: !4)
!153 = !DILocation(line: 82, column: 12, scope: !151)
!154 = !DILocation(line: 83, column: 10, scope: !151)
!155 = !DILocation(line: 85, column: 20, scope: !151)
!156 = !DILocation(line: 85, column: 10, scope: !151)
!157 = !DILocation(line: 86, column: 9, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !15, line: 86, column: 9)
!159 = !DILocation(line: 86, column: 14, scope: !158)
!160 = !DILocation(line: 86, column: 9, scope: !151)
!161 = !DILocation(line: 86, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 86, column: 23)
!163 = !DILocation(line: 87, column: 12, scope: !151)
!164 = !DILocation(line: 87, column: 5, scope: !151)
!165 = !DILocation(line: 88, column: 5, scope: !151)
!166 = !DILocation(line: 88, column: 17, scope: !151)
!167 = !DILocation(line: 89, column: 61, scope: !151)
!168 = !DILocation(line: 89, column: 5, scope: !151)
!169 = !DILocation(line: 90, column: 1, scope: !151)
