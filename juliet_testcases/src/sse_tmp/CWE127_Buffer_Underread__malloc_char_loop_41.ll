; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !20, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %0, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data.addr, align 8, !dbg !41
  %2 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx1 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !41
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !41
  %4 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !45
  store i8 %3, i8* %arrayidx2, align 1, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %5, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx3, align 1, !dbg !54
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay4), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_41_bad() #0 !dbg !58 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !61, metadata !DIExpression()), !dbg !62
  store i8* null, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !64, metadata !DIExpression()), !dbg !66
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !67
  store i8* %call, i8** %dataBuffer, align 8, !dbg !66
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !68
  %cmp = icmp eq i8* %0, null, !dbg !70
  br i1 %cmp, label %if.then, label %if.end, !dbg !71

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !75
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !79
  store i8* %add.ptr, i8** %data, align 8, !dbg !80
  %4 = load i8*, i8** %data, align 8, !dbg !81
  call void @CWE127_Buffer_Underread__malloc_char_loop_41_badSink(i8* %4), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_41_goodG2BSink(i8* %data) #0 !dbg !84 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %i, metadata !87, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !92
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  store i64 0, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !98
  %cmp = icmp ult i64 %0, 100, !dbg !100
  br i1 %cmp, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %1 = load i8*, i8** %data.addr, align 8, !dbg !102
  %2 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx1 = getelementptr inbounds i8, i8* %1, i64 %2, !dbg !102
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !102
  %4 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %4, !dbg !106
  store i8 %3, i8* %arrayidx2, align 1, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !109
  %inc = add i64 %5, 1, !dbg !109
  store i64 %inc, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx3, align 1, !dbg !114
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  call void @printLine(i8* %arraydecay4), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__malloc_char_loop_41_good() #0 !dbg !118 {
entry:
  call void @goodG2B(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !121 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !126, metadata !DIExpression()), !dbg !127
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !128, metadata !DIExpression()), !dbg !129
  %call = call i64 @time(i64* null) #6, !dbg !130
  %conv = trunc i64 %call to i32, !dbg !131
  call void @srand(i32 %conv) #6, !dbg !132
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !133
  call void @CWE127_Buffer_Underread__malloc_char_loop_41_good(), !dbg !134
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !135
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !136
  call void @CWE127_Buffer_Underread__malloc_char_loop_41_bad(), !dbg !137
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !138
  ret i32 0, !dbg !139
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !140 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !141, metadata !DIExpression()), !dbg !142
  store i8* null, i8** %data, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !144, metadata !DIExpression()), !dbg !146
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !147
  store i8* %call, i8** %dataBuffer, align 8, !dbg !146
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !148
  %cmp = icmp eq i8* %0, null, !dbg !150
  br i1 %cmp, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !155
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !156
  store i8 0, i8* %arrayidx, align 1, !dbg !157
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !158
  store i8* %3, i8** %data, align 8, !dbg !159
  %4 = load i8*, i8** %data, align 8, !dbg !160
  call void @CWE127_Buffer_Underread__malloc_char_loop_41_goodG2BSink(i8* %4), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__malloc_char_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 66, scope: !14)
!20 = !DILocalVariable(name: "i", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !23, line: 46, baseType: !24)
!23 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 26, column: 16, scope: !21)
!26 = !DILocalVariable(name: "dest", scope: !21, file: !15, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 14, scope: !21)
!31 = !DILocation(line: 28, column: 9, scope: !21)
!32 = !DILocation(line: 29, column: 9, scope: !21)
!33 = !DILocation(line: 29, column: 21, scope: !21)
!34 = !DILocation(line: 31, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !15, line: 31, column: 9)
!36 = !DILocation(line: 31, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !15, line: 31, column: 9)
!39 = !DILocation(line: 31, column: 23, scope: !38)
!40 = !DILocation(line: 31, column: 9, scope: !35)
!41 = !DILocation(line: 33, column: 23, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 32, column: 9)
!43 = !DILocation(line: 33, column: 28, scope: !42)
!44 = !DILocation(line: 33, column: 18, scope: !42)
!45 = !DILocation(line: 33, column: 13, scope: !42)
!46 = !DILocation(line: 33, column: 21, scope: !42)
!47 = !DILocation(line: 34, column: 9, scope: !42)
!48 = !DILocation(line: 31, column: 31, scope: !38)
!49 = !DILocation(line: 31, column: 9, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 34, column: 9, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 36, column: 9, scope: !21)
!54 = !DILocation(line: 36, column: 21, scope: !21)
!55 = !DILocation(line: 37, column: 19, scope: !21)
!56 = !DILocation(line: 37, column: 9, scope: !21)
!57 = !DILocation(line: 41, column: 1, scope: !14)
!58 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_41_bad", scope: !15, file: !15, line: 43, type: !59, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{null}
!61 = !DILocalVariable(name: "data", scope: !58, file: !15, line: 45, type: !4)
!62 = !DILocation(line: 45, column: 12, scope: !58)
!63 = !DILocation(line: 46, column: 10, scope: !58)
!64 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !15, line: 48, type: !4)
!65 = distinct !DILexicalBlock(scope: !58, file: !15, line: 47, column: 5)
!66 = !DILocation(line: 48, column: 16, scope: !65)
!67 = !DILocation(line: 48, column: 37, scope: !65)
!68 = !DILocation(line: 49, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !15, line: 49, column: 13)
!70 = !DILocation(line: 49, column: 24, scope: !69)
!71 = !DILocation(line: 49, column: 13, scope: !65)
!72 = !DILocation(line: 49, column: 34, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 49, column: 33)
!74 = !DILocation(line: 50, column: 16, scope: !65)
!75 = !DILocation(line: 50, column: 9, scope: !65)
!76 = !DILocation(line: 51, column: 9, scope: !65)
!77 = !DILocation(line: 51, column: 27, scope: !65)
!78 = !DILocation(line: 53, column: 16, scope: !65)
!79 = !DILocation(line: 53, column: 27, scope: !65)
!80 = !DILocation(line: 53, column: 14, scope: !65)
!81 = !DILocation(line: 55, column: 58, scope: !58)
!82 = !DILocation(line: 55, column: 5, scope: !58)
!83 = !DILocation(line: 56, column: 1, scope: !58)
!84 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_41_goodG2BSink", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!85 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !15, line: 62, type: !4)
!86 = !DILocation(line: 62, column: 70, scope: !84)
!87 = !DILocalVariable(name: "i", scope: !88, file: !15, line: 65, type: !22)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 64, column: 5)
!89 = !DILocation(line: 65, column: 16, scope: !88)
!90 = !DILocalVariable(name: "dest", scope: !88, file: !15, line: 66, type: !27)
!91 = !DILocation(line: 66, column: 14, scope: !88)
!92 = !DILocation(line: 67, column: 9, scope: !88)
!93 = !DILocation(line: 68, column: 9, scope: !88)
!94 = !DILocation(line: 68, column: 21, scope: !88)
!95 = !DILocation(line: 70, column: 16, scope: !96)
!96 = distinct !DILexicalBlock(scope: !88, file: !15, line: 70, column: 9)
!97 = !DILocation(line: 70, column: 14, scope: !96)
!98 = !DILocation(line: 70, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !15, line: 70, column: 9)
!100 = !DILocation(line: 70, column: 23, scope: !99)
!101 = !DILocation(line: 70, column: 9, scope: !96)
!102 = !DILocation(line: 72, column: 23, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 71, column: 9)
!104 = !DILocation(line: 72, column: 28, scope: !103)
!105 = !DILocation(line: 72, column: 18, scope: !103)
!106 = !DILocation(line: 72, column: 13, scope: !103)
!107 = !DILocation(line: 72, column: 21, scope: !103)
!108 = !DILocation(line: 73, column: 9, scope: !103)
!109 = !DILocation(line: 70, column: 31, scope: !99)
!110 = !DILocation(line: 70, column: 9, scope: !99)
!111 = distinct !{!111, !101, !112, !52}
!112 = !DILocation(line: 73, column: 9, scope: !96)
!113 = !DILocation(line: 75, column: 9, scope: !88)
!114 = !DILocation(line: 75, column: 21, scope: !88)
!115 = !DILocation(line: 76, column: 19, scope: !88)
!116 = !DILocation(line: 76, column: 9, scope: !88)
!117 = !DILocation(line: 80, column: 1, scope: !84)
!118 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__malloc_char_loop_41_good", scope: !15, file: !15, line: 98, type: !59, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocation(line: 100, column: 5, scope: !118)
!120 = !DILocation(line: 101, column: 1, scope: !118)
!121 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 113, type: !122, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DISubroutineType(types: !123)
!123 = !{!124, !124, !125}
!124 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!126 = !DILocalVariable(name: "argc", arg: 1, scope: !121, file: !15, line: 113, type: !124)
!127 = !DILocation(line: 113, column: 14, scope: !121)
!128 = !DILocalVariable(name: "argv", arg: 2, scope: !121, file: !15, line: 113, type: !125)
!129 = !DILocation(line: 113, column: 27, scope: !121)
!130 = !DILocation(line: 116, column: 22, scope: !121)
!131 = !DILocation(line: 116, column: 12, scope: !121)
!132 = !DILocation(line: 116, column: 5, scope: !121)
!133 = !DILocation(line: 118, column: 5, scope: !121)
!134 = !DILocation(line: 119, column: 5, scope: !121)
!135 = !DILocation(line: 120, column: 5, scope: !121)
!136 = !DILocation(line: 123, column: 5, scope: !121)
!137 = !DILocation(line: 124, column: 5, scope: !121)
!138 = !DILocation(line: 125, column: 5, scope: !121)
!139 = !DILocation(line: 127, column: 5, scope: !121)
!140 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 83, type: !59, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!141 = !DILocalVariable(name: "data", scope: !140, file: !15, line: 85, type: !4)
!142 = !DILocation(line: 85, column: 12, scope: !140)
!143 = !DILocation(line: 86, column: 10, scope: !140)
!144 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !15, line: 88, type: !4)
!145 = distinct !DILexicalBlock(scope: !140, file: !15, line: 87, column: 5)
!146 = !DILocation(line: 88, column: 16, scope: !145)
!147 = !DILocation(line: 88, column: 37, scope: !145)
!148 = !DILocation(line: 89, column: 13, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 89, column: 13)
!150 = !DILocation(line: 89, column: 24, scope: !149)
!151 = !DILocation(line: 89, column: 13, scope: !145)
!152 = !DILocation(line: 89, column: 34, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 89, column: 33)
!154 = !DILocation(line: 90, column: 16, scope: !145)
!155 = !DILocation(line: 90, column: 9, scope: !145)
!156 = !DILocation(line: 91, column: 9, scope: !145)
!157 = !DILocation(line: 91, column: 27, scope: !145)
!158 = !DILocation(line: 93, column: 16, scope: !145)
!159 = !DILocation(line: 93, column: 14, scope: !145)
!160 = !DILocation(line: 95, column: 62, scope: !140)
!161 = !DILocation(line: 95, column: 5, scope: !140)
!162 = !DILocation(line: 96, column: 1, scope: !140)
