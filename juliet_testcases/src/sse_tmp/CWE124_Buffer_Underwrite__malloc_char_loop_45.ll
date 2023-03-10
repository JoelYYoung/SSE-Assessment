; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_45.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE124_Buffer_Underwrite__malloc_char_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE124_Buffer_Underwrite__malloc_char_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !11

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
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
  %4 = load i8*, i8** %data, align 8, !dbg !43
  store i8* %4, i8** @CWE124_Buffer_Underwrite__malloc_char_loop_45_badData, align 8, !dbg !44
  call void @badSink(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_loop_45_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_45_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE124_Buffer_Underwrite__malloc_char_loop_45_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i8*, i8** @CWE124_Buffer_Underwrite__malloc_char_loop_45_badData, align 8, !dbg !72
  store i8* %0, i8** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !79, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !84
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  store i64 0, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !90
  %cmp = icmp ult i64 %1, 100, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !96
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  %5 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !97
  store i8 %3, i8* %arrayidx2, align 1, !dbg !99
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !101
  %inc = add i64 %6, 1, !dbg !101
  store i64 %inc, i64* %i, align 8, !dbg !101
  br label %for.cond, !dbg !102, !llvm.loop !103

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !106
  store i8 0, i8* %arrayidx3, align 1, !dbg !107
  %8 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* %8), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
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
  %4 = load i8*, i8** %data, align 8, !dbg !131
  store i8* %4, i8** @CWE124_Buffer_Underwrite__malloc_char_loop_45_goodG2BData, align 8, !dbg !132
  call void @goodG2BSink(), !dbg !133
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !135 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = load i8*, i8** @CWE124_Buffer_Underwrite__malloc_char_loop_45_goodG2BData, align 8, !dbg !138
  store i8* %0, i8** %data, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !144
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !150
  %cmp = icmp ult i64 %1, 100, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !156
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !156
  %4 = load i8*, i8** %data, align 8, !dbg !157
  %5 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !157
  store i8 %3, i8* %arrayidx2, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %6, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !165
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !165
  store i8 0, i8* %arrayidx3, align 1, !dbg !166
  %8 = load i8*, i8** %data, align 8, !dbg !167
  call void @printLine(i8* %8), !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_char_loop_45_badData", scope: !2, file: !13, line: 21, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "CWE124_Buffer_Underwrite__malloc_char_loop_45_goodG2BData", scope: !2, file: !13, line: 22, type: !6, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_loop_45.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_45_bad", scope: !13, file: !13, line: 47, type: !21, scopeLine: 48, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !13, line: 49, type: !6)
!24 = !DILocation(line: 49, column: 12, scope: !20)
!25 = !DILocation(line: 50, column: 10, scope: !20)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !13, line: 52, type: !6)
!27 = distinct !DILexicalBlock(scope: !20, file: !13, line: 51, column: 5)
!28 = !DILocation(line: 52, column: 16, scope: !27)
!29 = !DILocation(line: 52, column: 37, scope: !27)
!30 = !DILocation(line: 53, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !13, line: 53, column: 13)
!32 = !DILocation(line: 53, column: 24, scope: !31)
!33 = !DILocation(line: 53, column: 13, scope: !27)
!34 = !DILocation(line: 53, column: 34, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !13, line: 53, column: 33)
!36 = !DILocation(line: 54, column: 16, scope: !27)
!37 = !DILocation(line: 54, column: 9, scope: !27)
!38 = !DILocation(line: 55, column: 9, scope: !27)
!39 = !DILocation(line: 55, column: 27, scope: !27)
!40 = !DILocation(line: 57, column: 16, scope: !27)
!41 = !DILocation(line: 57, column: 27, scope: !27)
!42 = !DILocation(line: 57, column: 14, scope: !27)
!43 = !DILocation(line: 59, column: 61, scope: !20)
!44 = !DILocation(line: 59, column: 59, scope: !20)
!45 = !DILocation(line: 60, column: 5, scope: !20)
!46 = !DILocation(line: 61, column: 1, scope: !20)
!47 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_loop_45_good", scope: !13, file: !13, line: 105, type: !21, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocation(line: 107, column: 5, scope: !47)
!49 = !DILocation(line: 108, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 119, type: !51, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !13, line: 119, type: !53)
!56 = !DILocation(line: 119, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !13, line: 119, type: !54)
!58 = !DILocation(line: 119, column: 27, scope: !50)
!59 = !DILocation(line: 122, column: 22, scope: !50)
!60 = !DILocation(line: 122, column: 12, scope: !50)
!61 = !DILocation(line: 122, column: 5, scope: !50)
!62 = !DILocation(line: 124, column: 5, scope: !50)
!63 = !DILocation(line: 125, column: 5, scope: !50)
!64 = !DILocation(line: 126, column: 5, scope: !50)
!65 = !DILocation(line: 129, column: 5, scope: !50)
!66 = !DILocation(line: 130, column: 5, scope: !50)
!67 = !DILocation(line: 131, column: 5, scope: !50)
!68 = !DILocation(line: 133, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "badSink", scope: !13, file: !13, line: 26, type: !21, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocalVariable(name: "data", scope: !69, file: !13, line: 28, type: !6)
!71 = !DILocation(line: 28, column: 12, scope: !69)
!72 = !DILocation(line: 28, column: 19, scope: !69)
!73 = !DILocalVariable(name: "i", scope: !74, file: !13, line: 30, type: !75)
!74 = distinct !DILexicalBlock(scope: !69, file: !13, line: 29, column: 5)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !76, line: 46, baseType: !77)
!76 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!77 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!78 = !DILocation(line: 30, column: 16, scope: !74)
!79 = !DILocalVariable(name: "source", scope: !74, file: !13, line: 31, type: !80)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 100)
!83 = !DILocation(line: 31, column: 14, scope: !74)
!84 = !DILocation(line: 32, column: 9, scope: !74)
!85 = !DILocation(line: 33, column: 9, scope: !74)
!86 = !DILocation(line: 33, column: 23, scope: !74)
!87 = !DILocation(line: 35, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !74, file: !13, line: 35, column: 9)
!89 = !DILocation(line: 35, column: 14, scope: !88)
!90 = !DILocation(line: 35, column: 21, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !13, line: 35, column: 9)
!92 = !DILocation(line: 35, column: 23, scope: !91)
!93 = !DILocation(line: 35, column: 9, scope: !88)
!94 = !DILocation(line: 37, column: 30, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !13, line: 36, column: 9)
!96 = !DILocation(line: 37, column: 23, scope: !95)
!97 = !DILocation(line: 37, column: 13, scope: !95)
!98 = !DILocation(line: 37, column: 18, scope: !95)
!99 = !DILocation(line: 37, column: 21, scope: !95)
!100 = !DILocation(line: 38, column: 9, scope: !95)
!101 = !DILocation(line: 35, column: 31, scope: !91)
!102 = !DILocation(line: 35, column: 9, scope: !91)
!103 = distinct !{!103, !93, !104, !105}
!104 = !DILocation(line: 38, column: 9, scope: !88)
!105 = !{!"llvm.loop.mustprogress"}
!106 = !DILocation(line: 40, column: 9, scope: !74)
!107 = !DILocation(line: 40, column: 21, scope: !74)
!108 = !DILocation(line: 41, column: 19, scope: !74)
!109 = !DILocation(line: 41, column: 9, scope: !74)
!110 = !DILocation(line: 45, column: 1, scope: !69)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !13, file: !13, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "data", scope: !111, file: !13, line: 91, type: !6)
!113 = !DILocation(line: 91, column: 12, scope: !111)
!114 = !DILocation(line: 92, column: 10, scope: !111)
!115 = !DILocalVariable(name: "dataBuffer", scope: !116, file: !13, line: 94, type: !6)
!116 = distinct !DILexicalBlock(scope: !111, file: !13, line: 93, column: 5)
!117 = !DILocation(line: 94, column: 16, scope: !116)
!118 = !DILocation(line: 94, column: 37, scope: !116)
!119 = !DILocation(line: 95, column: 13, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !13, line: 95, column: 13)
!121 = !DILocation(line: 95, column: 24, scope: !120)
!122 = !DILocation(line: 95, column: 13, scope: !116)
!123 = !DILocation(line: 95, column: 34, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !13, line: 95, column: 33)
!125 = !DILocation(line: 96, column: 16, scope: !116)
!126 = !DILocation(line: 96, column: 9, scope: !116)
!127 = !DILocation(line: 97, column: 9, scope: !116)
!128 = !DILocation(line: 97, column: 27, scope: !116)
!129 = !DILocation(line: 99, column: 16, scope: !116)
!130 = !DILocation(line: 99, column: 14, scope: !116)
!131 = !DILocation(line: 101, column: 65, scope: !111)
!132 = !DILocation(line: 101, column: 63, scope: !111)
!133 = !DILocation(line: 102, column: 5, scope: !111)
!134 = !DILocation(line: 103, column: 1, scope: !111)
!135 = distinct !DISubprogram(name: "goodG2BSink", scope: !13, file: !13, line: 68, type: !21, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!136 = !DILocalVariable(name: "data", scope: !135, file: !13, line: 70, type: !6)
!137 = !DILocation(line: 70, column: 12, scope: !135)
!138 = !DILocation(line: 70, column: 19, scope: !135)
!139 = !DILocalVariable(name: "i", scope: !140, file: !13, line: 72, type: !75)
!140 = distinct !DILexicalBlock(scope: !135, file: !13, line: 71, column: 5)
!141 = !DILocation(line: 72, column: 16, scope: !140)
!142 = !DILocalVariable(name: "source", scope: !140, file: !13, line: 73, type: !80)
!143 = !DILocation(line: 73, column: 14, scope: !140)
!144 = !DILocation(line: 74, column: 9, scope: !140)
!145 = !DILocation(line: 75, column: 9, scope: !140)
!146 = !DILocation(line: 75, column: 23, scope: !140)
!147 = !DILocation(line: 77, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !140, file: !13, line: 77, column: 9)
!149 = !DILocation(line: 77, column: 14, scope: !148)
!150 = !DILocation(line: 77, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !13, line: 77, column: 9)
!152 = !DILocation(line: 77, column: 23, scope: !151)
!153 = !DILocation(line: 77, column: 9, scope: !148)
!154 = !DILocation(line: 79, column: 30, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !13, line: 78, column: 9)
!156 = !DILocation(line: 79, column: 23, scope: !155)
!157 = !DILocation(line: 79, column: 13, scope: !155)
!158 = !DILocation(line: 79, column: 18, scope: !155)
!159 = !DILocation(line: 79, column: 21, scope: !155)
!160 = !DILocation(line: 80, column: 9, scope: !155)
!161 = !DILocation(line: 77, column: 31, scope: !151)
!162 = !DILocation(line: 77, column: 9, scope: !151)
!163 = distinct !{!163, !153, !164, !105}
!164 = !DILocation(line: 80, column: 9, scope: !148)
!165 = !DILocation(line: 82, column: 9, scope: !140)
!166 = !DILocation(line: 82, column: 21, scope: !140)
!167 = !DILocation(line: 83, column: 19, scope: !140)
!168 = !DILocation(line: 83, column: 9, scope: !140)
!169 = !DILocation(line: 87, column: 1, scope: !135)
