; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !29
  store i8* %call, i8** %dataBuffer, align 8, !dbg !28
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !37
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !41
  store i8* %add.ptr, i8** %data, align 8, !dbg !42
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  call void %4(i8* %5), !dbg !43
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !55, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !60
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !66
  %cmp = icmp ult i64 %0, 100, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !72
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !72
  %3 = load i8*, i8** %data.addr, align 8, !dbg !73
  %4 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !73
  store i8 %2, i8* %arrayidx2, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %5, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !82
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !82
  store i8 0, i8* %arrayidx3, align 1, !dbg !83
  %7 = load i8*, i8** %data.addr, align 8, !dbg !84
  call void @printLine(i8* %7), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_44_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* null) #6, !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 %conv) #6, !dbg !101
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_44_good(), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_44_bad(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !112, metadata !DIExpression()), !dbg !113
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !113
  store i8* null, i8** %data, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !115, metadata !DIExpression()), !dbg !117
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !118
  store i8* %call, i8** %dataBuffer, align 8, !dbg !117
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !119
  %cmp = icmp eq i8* %0, null, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !123
  unreachable, !dbg !123

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !126
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !128
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !129
  store i8* %3, i8** %data, align 8, !dbg !130
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !131
  %5 = load i8*, i8** %data, align 8, !dbg !132
  call void %4(i8* %5), !dbg !131
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !134 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !142
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !143
  store i8 0, i8* %arrayidx, align 1, !dbg !144
  store i64 0, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !148
  %cmp = icmp ult i64 %0, 100, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !154
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !154
  %3 = load i8*, i8** %data.addr, align 8, !dbg !155
  %4 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !155
  store i8 %2, i8* %arrayidx2, align 1, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %5, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !163
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !163
  store i8 0, i8* %arrayidx3, align 1, !dbg !164
  %7 = load i8*, i8** %data.addr, align 8, !dbg !165
  call void @printLine(i8* %7), !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_44_bad", scope: !15, file: !15, line: 43, type: !16, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 45, type: !4)
!19 = !DILocation(line: 45, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 47, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 47, column: 12, scope: !14)
!25 = !DILocation(line: 48, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !15, line: 50, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 49, column: 5)
!28 = !DILocation(line: 50, column: 16, scope: !27)
!29 = !DILocation(line: 50, column: 37, scope: !27)
!30 = !DILocation(line: 51, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 51, column: 13)
!32 = !DILocation(line: 51, column: 24, scope: !31)
!33 = !DILocation(line: 51, column: 13, scope: !27)
!34 = !DILocation(line: 51, column: 34, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 51, column: 33)
!36 = !DILocation(line: 52, column: 16, scope: !27)
!37 = !DILocation(line: 52, column: 9, scope: !27)
!38 = !DILocation(line: 53, column: 9, scope: !27)
!39 = !DILocation(line: 53, column: 27, scope: !27)
!40 = !DILocation(line: 55, column: 16, scope: !27)
!41 = !DILocation(line: 55, column: 27, scope: !27)
!42 = !DILocation(line: 55, column: 14, scope: !27)
!43 = !DILocation(line: 58, column: 5, scope: !14)
!44 = !DILocation(line: 58, column: 13, scope: !14)
!45 = !DILocation(line: 59, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !15, line: 23, type: !4)
!48 = !DILocation(line: 23, column: 28, scope: !46)
!49 = !DILocalVariable(name: "i", scope: !50, file: !15, line: 26, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 25, column: 5)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 26, column: 16, scope: !50)
!55 = !DILocalVariable(name: "source", scope: !50, file: !15, line: 27, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 27, column: 14, scope: !50)
!60 = !DILocation(line: 28, column: 9, scope: !50)
!61 = !DILocation(line: 29, column: 9, scope: !50)
!62 = !DILocation(line: 29, column: 23, scope: !50)
!63 = !DILocation(line: 31, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !50, file: !15, line: 31, column: 9)
!65 = !DILocation(line: 31, column: 14, scope: !64)
!66 = !DILocation(line: 31, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 31, column: 9)
!68 = !DILocation(line: 31, column: 23, scope: !67)
!69 = !DILocation(line: 31, column: 9, scope: !64)
!70 = !DILocation(line: 33, column: 30, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 32, column: 9)
!72 = !DILocation(line: 33, column: 23, scope: !71)
!73 = !DILocation(line: 33, column: 13, scope: !71)
!74 = !DILocation(line: 33, column: 18, scope: !71)
!75 = !DILocation(line: 33, column: 21, scope: !71)
!76 = !DILocation(line: 34, column: 9, scope: !71)
!77 = !DILocation(line: 31, column: 31, scope: !67)
!78 = !DILocation(line: 31, column: 9, scope: !67)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 34, column: 9, scope: !64)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 36, column: 9, scope: !50)
!83 = !DILocation(line: 36, column: 21, scope: !50)
!84 = !DILocation(line: 37, column: 19, scope: !50)
!85 = !DILocation(line: 37, column: 9, scope: !50)
!86 = !DILocation(line: 41, column: 1, scope: !46)
!87 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_44_good", scope: !15, file: !15, line: 102, type: !16, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 104, column: 5, scope: !87)
!89 = !DILocation(line: 105, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 116, type: !91, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !94}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !15, line: 116, type: !93)
!96 = !DILocation(line: 116, column: 14, scope: !90)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !15, line: 116, type: !94)
!98 = !DILocation(line: 116, column: 27, scope: !90)
!99 = !DILocation(line: 119, column: 22, scope: !90)
!100 = !DILocation(line: 119, column: 12, scope: !90)
!101 = !DILocation(line: 119, column: 5, scope: !90)
!102 = !DILocation(line: 121, column: 5, scope: !90)
!103 = !DILocation(line: 122, column: 5, scope: !90)
!104 = !DILocation(line: 123, column: 5, scope: !90)
!105 = !DILocation(line: 126, column: 5, scope: !90)
!106 = !DILocation(line: 127, column: 5, scope: !90)
!107 = !DILocation(line: 128, column: 5, scope: !90)
!108 = !DILocation(line: 130, column: 5, scope: !90)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 88, type: !4)
!111 = !DILocation(line: 88, column: 12, scope: !109)
!112 = !DILocalVariable(name: "funcPtr", scope: !109, file: !15, line: 89, type: !21)
!113 = !DILocation(line: 89, column: 12, scope: !109)
!114 = !DILocation(line: 90, column: 10, scope: !109)
!115 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !15, line: 92, type: !4)
!116 = distinct !DILexicalBlock(scope: !109, file: !15, line: 91, column: 5)
!117 = !DILocation(line: 92, column: 16, scope: !116)
!118 = !DILocation(line: 92, column: 37, scope: !116)
!119 = !DILocation(line: 93, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 93, column: 13)
!121 = !DILocation(line: 93, column: 24, scope: !120)
!122 = !DILocation(line: 93, column: 13, scope: !116)
!123 = !DILocation(line: 93, column: 34, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 93, column: 33)
!125 = !DILocation(line: 94, column: 16, scope: !116)
!126 = !DILocation(line: 94, column: 9, scope: !116)
!127 = !DILocation(line: 95, column: 9, scope: !116)
!128 = !DILocation(line: 95, column: 27, scope: !116)
!129 = !DILocation(line: 97, column: 16, scope: !116)
!130 = !DILocation(line: 97, column: 14, scope: !116)
!131 = !DILocation(line: 99, column: 5, scope: !109)
!132 = !DILocation(line: 99, column: 13, scope: !109)
!133 = !DILocation(line: 100, column: 1, scope: !109)
!134 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 66, type: !22, scopeLine: 67, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", arg: 1, scope: !134, file: !15, line: 66, type: !4)
!136 = !DILocation(line: 66, column: 32, scope: !134)
!137 = !DILocalVariable(name: "i", scope: !138, file: !15, line: 69, type: !51)
!138 = distinct !DILexicalBlock(scope: !134, file: !15, line: 68, column: 5)
!139 = !DILocation(line: 69, column: 16, scope: !138)
!140 = !DILocalVariable(name: "source", scope: !138, file: !15, line: 70, type: !56)
!141 = !DILocation(line: 70, column: 14, scope: !138)
!142 = !DILocation(line: 71, column: 9, scope: !138)
!143 = !DILocation(line: 72, column: 9, scope: !138)
!144 = !DILocation(line: 72, column: 23, scope: !138)
!145 = !DILocation(line: 74, column: 16, scope: !146)
!146 = distinct !DILexicalBlock(scope: !138, file: !15, line: 74, column: 9)
!147 = !DILocation(line: 74, column: 14, scope: !146)
!148 = !DILocation(line: 74, column: 21, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !15, line: 74, column: 9)
!150 = !DILocation(line: 74, column: 23, scope: !149)
!151 = !DILocation(line: 74, column: 9, scope: !146)
!152 = !DILocation(line: 76, column: 30, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 75, column: 9)
!154 = !DILocation(line: 76, column: 23, scope: !153)
!155 = !DILocation(line: 76, column: 13, scope: !153)
!156 = !DILocation(line: 76, column: 18, scope: !153)
!157 = !DILocation(line: 76, column: 21, scope: !153)
!158 = !DILocation(line: 77, column: 9, scope: !153)
!159 = !DILocation(line: 74, column: 31, scope: !149)
!160 = !DILocation(line: 74, column: 9, scope: !149)
!161 = distinct !{!161, !151, !162, !81}
!162 = !DILocation(line: 77, column: 9, scope: !146)
!163 = !DILocation(line: 79, column: 9, scope: !138)
!164 = !DILocation(line: 79, column: 21, scope: !138)
!165 = !DILocation(line: 80, column: 19, scope: !138)
!166 = !DILocation(line: 80, column: 9, scope: !138)
!167 = !DILocation(line: 84, column: 1, scope: !134)
