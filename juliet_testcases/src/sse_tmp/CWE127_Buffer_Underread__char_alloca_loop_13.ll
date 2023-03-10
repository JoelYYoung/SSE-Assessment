; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_13.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_13.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_FIVE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_13_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !26
  %cmp = icmp eq i32 %3, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !52
  %cmp2 = icmp ult i64 %5, 100, !dbg !54
  br i1 %cmp2, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !56
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !56
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !56
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !60
  store i8 %8, i8* %arrayidx4, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %10, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !68
  store i8 0, i8* %arrayidx5, align 1, !dbg !69
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !70
  call void @printLine(i8* %arraydecay6), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_13_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #5, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #5, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__char_alloca_loop_13_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE127_Buffer_Underread__char_alloca_loop_13_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %0, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !103
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !106
  %cmp = icmp ne i32 %3, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !113
  store i8* %4, i8** %data, align 8, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !121
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx1, align 1, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !127
  %cmp2 = icmp ult i64 %5, 100, !dbg !129
  br i1 %cmp2, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !131
  %7 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !131
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !131
  %9 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !135
  store i8 %8, i8* %arrayidx4, align 1, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %10, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx5, align 1, !dbg !143
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  call void @printLine(i8* %arraydecay6), !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = alloca i8, i64 100, align 16, !dbg !152
  store i8* %0, i8** %dataBuffer, align 8, !dbg !151
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !154
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !156
  %3 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !157
  %cmp = icmp eq i32 %3, 5, !dbg !159
  br i1 %cmp, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !161
  store i8* %4, i8** %data, align 8, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !168, metadata !DIExpression()), !dbg !169
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !170
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !171
  store i8 0, i8* %arrayidx1, align 1, !dbg !172
  store i64 0, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !176
  %cmp2 = icmp ult i64 %5, 100, !dbg !178
  br i1 %cmp2, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !180
  %7 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !180
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !180
  %9 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %9, !dbg !184
  store i8 %8, i8* %arrayidx4, align 1, !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !187
  %inc = add i64 %10, 1, !dbg !187
  store i64 %inc, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !191
  store i8 0, i8* %arrayidx5, align 1, !dbg !192
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !193
  call void @printLine(i8* %arraydecay6), !dbg !194
  ret void, !dbg !195
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_13_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_13.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 29, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!28 = !DILocation(line: 29, column: 25, scope: !27)
!29 = !DILocation(line: 29, column: 8, scope: !13)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 35, column: 16, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 36, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 36, column: 14, scope: !36)
!46 = !DILocation(line: 37, column: 9, scope: !36)
!47 = !DILocation(line: 38, column: 9, scope: !36)
!48 = !DILocation(line: 38, column: 21, scope: !36)
!49 = !DILocation(line: 40, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !36, file: !14, line: 40, column: 9)
!51 = !DILocation(line: 40, column: 14, scope: !50)
!52 = !DILocation(line: 40, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !14, line: 40, column: 9)
!54 = !DILocation(line: 40, column: 23, scope: !53)
!55 = !DILocation(line: 40, column: 9, scope: !50)
!56 = !DILocation(line: 42, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !14, line: 41, column: 9)
!58 = !DILocation(line: 42, column: 28, scope: !57)
!59 = !DILocation(line: 42, column: 18, scope: !57)
!60 = !DILocation(line: 42, column: 13, scope: !57)
!61 = !DILocation(line: 42, column: 21, scope: !57)
!62 = !DILocation(line: 43, column: 9, scope: !57)
!63 = !DILocation(line: 40, column: 31, scope: !53)
!64 = !DILocation(line: 40, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 43, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 45, column: 9, scope: !36)
!69 = !DILocation(line: 45, column: 21, scope: !36)
!70 = !DILocation(line: 46, column: 19, scope: !36)
!71 = !DILocation(line: 46, column: 9, scope: !36)
!72 = !DILocation(line: 48, column: 1, scope: !13)
!73 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_13_good", scope: !14, file: !14, line: 115, type: !15, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 117, column: 5, scope: !73)
!75 = !DILocation(line: 118, column: 5, scope: !73)
!76 = !DILocation(line: 119, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 131, type: !78, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !14, line: 131, type: !80)
!83 = !DILocation(line: 131, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !14, line: 131, type: !81)
!85 = !DILocation(line: 131, column: 27, scope: !77)
!86 = !DILocation(line: 134, column: 22, scope: !77)
!87 = !DILocation(line: 134, column: 12, scope: !77)
!88 = !DILocation(line: 134, column: 5, scope: !77)
!89 = !DILocation(line: 136, column: 5, scope: !77)
!90 = !DILocation(line: 137, column: 5, scope: !77)
!91 = !DILocation(line: 138, column: 5, scope: !77)
!92 = !DILocation(line: 141, column: 5, scope: !77)
!93 = !DILocation(line: 142, column: 5, scope: !77)
!94 = !DILocation(line: 143, column: 5, scope: !77)
!95 = !DILocation(line: 145, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 57, type: !4)
!98 = !DILocation(line: 57, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !14, line: 58, type: !4)
!100 = !DILocation(line: 58, column: 12, scope: !96)
!101 = !DILocation(line: 58, column: 33, scope: !96)
!102 = !DILocation(line: 59, column: 12, scope: !96)
!103 = !DILocation(line: 59, column: 5, scope: !96)
!104 = !DILocation(line: 60, column: 5, scope: !96)
!105 = !DILocation(line: 60, column: 23, scope: !96)
!106 = !DILocation(line: 61, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !96, file: !14, line: 61, column: 8)
!108 = !DILocation(line: 61, column: 25, scope: !107)
!109 = !DILocation(line: 61, column: 8, scope: !96)
!110 = !DILocation(line: 64, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !14, line: 62, column: 5)
!112 = !DILocation(line: 65, column: 5, scope: !111)
!113 = !DILocation(line: 69, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !14, line: 67, column: 5)
!115 = !DILocation(line: 69, column: 14, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !14, line: 72, type: !37)
!117 = distinct !DILexicalBlock(scope: !96, file: !14, line: 71, column: 5)
!118 = !DILocation(line: 72, column: 16, scope: !117)
!119 = !DILocalVariable(name: "dest", scope: !117, file: !14, line: 73, type: !42)
!120 = !DILocation(line: 73, column: 14, scope: !117)
!121 = !DILocation(line: 74, column: 9, scope: !117)
!122 = !DILocation(line: 75, column: 9, scope: !117)
!123 = !DILocation(line: 75, column: 21, scope: !117)
!124 = !DILocation(line: 77, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !117, file: !14, line: 77, column: 9)
!126 = !DILocation(line: 77, column: 14, scope: !125)
!127 = !DILocation(line: 77, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !14, line: 77, column: 9)
!129 = !DILocation(line: 77, column: 23, scope: !128)
!130 = !DILocation(line: 77, column: 9, scope: !125)
!131 = !DILocation(line: 79, column: 23, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !14, line: 78, column: 9)
!133 = !DILocation(line: 79, column: 28, scope: !132)
!134 = !DILocation(line: 79, column: 18, scope: !132)
!135 = !DILocation(line: 79, column: 13, scope: !132)
!136 = !DILocation(line: 79, column: 21, scope: !132)
!137 = !DILocation(line: 80, column: 9, scope: !132)
!138 = !DILocation(line: 77, column: 31, scope: !128)
!139 = !DILocation(line: 77, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !67}
!141 = !DILocation(line: 80, column: 9, scope: !125)
!142 = !DILocation(line: 82, column: 9, scope: !117)
!143 = !DILocation(line: 82, column: 21, scope: !117)
!144 = !DILocation(line: 83, column: 19, scope: !117)
!145 = !DILocation(line: 83, column: 9, scope: !117)
!146 = !DILocation(line: 85, column: 1, scope: !96)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", scope: !147, file: !14, line: 90, type: !4)
!149 = !DILocation(line: 90, column: 12, scope: !147)
!150 = !DILocalVariable(name: "dataBuffer", scope: !147, file: !14, line: 91, type: !4)
!151 = !DILocation(line: 91, column: 12, scope: !147)
!152 = !DILocation(line: 91, column: 33, scope: !147)
!153 = !DILocation(line: 92, column: 12, scope: !147)
!154 = !DILocation(line: 92, column: 5, scope: !147)
!155 = !DILocation(line: 93, column: 5, scope: !147)
!156 = !DILocation(line: 93, column: 23, scope: !147)
!157 = !DILocation(line: 94, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !147, file: !14, line: 94, column: 8)
!159 = !DILocation(line: 94, column: 25, scope: !158)
!160 = !DILocation(line: 94, column: 8, scope: !147)
!161 = !DILocation(line: 97, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !14, line: 95, column: 5)
!163 = !DILocation(line: 97, column: 14, scope: !162)
!164 = !DILocation(line: 98, column: 5, scope: !162)
!165 = !DILocalVariable(name: "i", scope: !166, file: !14, line: 100, type: !37)
!166 = distinct !DILexicalBlock(scope: !147, file: !14, line: 99, column: 5)
!167 = !DILocation(line: 100, column: 16, scope: !166)
!168 = !DILocalVariable(name: "dest", scope: !166, file: !14, line: 101, type: !42)
!169 = !DILocation(line: 101, column: 14, scope: !166)
!170 = !DILocation(line: 102, column: 9, scope: !166)
!171 = !DILocation(line: 103, column: 9, scope: !166)
!172 = !DILocation(line: 103, column: 21, scope: !166)
!173 = !DILocation(line: 105, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !166, file: !14, line: 105, column: 9)
!175 = !DILocation(line: 105, column: 14, scope: !174)
!176 = !DILocation(line: 105, column: 21, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !14, line: 105, column: 9)
!178 = !DILocation(line: 105, column: 23, scope: !177)
!179 = !DILocation(line: 105, column: 9, scope: !174)
!180 = !DILocation(line: 107, column: 23, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !14, line: 106, column: 9)
!182 = !DILocation(line: 107, column: 28, scope: !181)
!183 = !DILocation(line: 107, column: 18, scope: !181)
!184 = !DILocation(line: 107, column: 13, scope: !181)
!185 = !DILocation(line: 107, column: 21, scope: !181)
!186 = !DILocation(line: 108, column: 9, scope: !181)
!187 = !DILocation(line: 105, column: 31, scope: !177)
!188 = !DILocation(line: 105, column: 9, scope: !177)
!189 = distinct !{!189, !179, !190, !67}
!190 = !DILocation(line: 108, column: 9, scope: !174)
!191 = !DILocation(line: 110, column: 9, scope: !166)
!192 = !DILocation(line: 110, column: 21, scope: !166)
!193 = !DILocation(line: 111, column: 19, scope: !166)
!194 = !DILocation(line: 111, column: 9, scope: !166)
!195 = !DILocation(line: 113, column: 1, scope: !147)
