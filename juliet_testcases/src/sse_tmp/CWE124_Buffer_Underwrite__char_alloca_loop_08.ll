; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %call = call i32 @staticReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx1, align 1, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %4, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !57
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !57
  %7 = load i8*, i8** %data, align 8, !dbg !58
  %8 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !58
  store i8 %6, i8* %arrayidx3, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %9, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !67
  store i8 0, i8* %arrayidx4, align 1, !dbg !68
  %11 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* %11), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_08_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_08_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_08_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !95 {
entry:
  ret i32 1, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 100, align 16, !dbg !104
  store i8* %0, i8** %dataBuffer, align 8, !dbg !103
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !106
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %call = call i32 @staticReturnsFalse(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !115
  store i8* %3, i8** %data, align 8, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx1, align 1, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %4, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !135
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !135
  %7 = load i8*, i8** %data, align 8, !dbg !136
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !136
  store i8 %6, i8* %arrayidx3, align 1, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %9, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !144
  store i8 0, i8* %arrayidx4, align 1, !dbg !145
  %11 = load i8*, i8** %data, align 8, !dbg !146
  call void @printLine(i8* %11), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !149 {
entry:
  ret i32 0, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = alloca i8, i64 100, align 16, !dbg !156
  store i8* %0, i8** %dataBuffer, align 8, !dbg !155
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !158
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !159
  store i8 0, i8* %arrayidx, align 1, !dbg !160
  %call = call i32 @staticReturnsTrue(), !dbg !161
  %tobool = icmp ne i32 %call, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !164
  store i8* %3, i8** %data, align 8, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !171, metadata !DIExpression()), !dbg !172
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !173
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !173
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !174
  store i8 0, i8* %arrayidx1, align 1, !dbg !175
  store i64 0, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !179
  %cmp = icmp ult i64 %4, 100, !dbg !181
  br i1 %cmp, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !185
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !185
  %7 = load i8*, i8** %data, align 8, !dbg !186
  %8 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !186
  store i8 %6, i8* %arrayidx3, align 1, !dbg !188
  br label %for.inc, !dbg !189

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !190
  %inc = add i64 %9, 1, !dbg !190
  store i64 %inc, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !191, !llvm.loop !192

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !194
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !194
  store i8 0, i8* %arrayidx4, align 1, !dbg !195
  %11 = load i8*, i8** %data, align 8, !dbg !196
  call void @printLine(i8* %11), !dbg !197
  ret void, !dbg !198
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !4)
!18 = !DILocation(line: 39, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !4)
!20 = !DILocation(line: 40, column: 12, scope: !13)
!21 = !DILocation(line: 40, column: 33, scope: !13)
!22 = !DILocation(line: 41, column: 12, scope: !13)
!23 = !DILocation(line: 41, column: 5, scope: !13)
!24 = !DILocation(line: 42, column: 5, scope: !13)
!25 = !DILocation(line: 42, column: 23, scope: !13)
!26 = !DILocation(line: 43, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 8)
!28 = !DILocation(line: 43, column: 8, scope: !13)
!29 = !DILocation(line: 46, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 44, column: 5)
!31 = !DILocation(line: 46, column: 27, scope: !30)
!32 = !DILocation(line: 46, column: 14, scope: !30)
!33 = !DILocation(line: 47, column: 5, scope: !30)
!34 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 49, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 49, column: 16, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !35, file: !14, line: 50, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 50, column: 14, scope: !35)
!45 = !DILocation(line: 51, column: 9, scope: !35)
!46 = !DILocation(line: 52, column: 9, scope: !35)
!47 = !DILocation(line: 52, column: 23, scope: !35)
!48 = !DILocation(line: 54, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !14, line: 54, column: 9)
!50 = !DILocation(line: 54, column: 14, scope: !49)
!51 = !DILocation(line: 54, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 54, column: 9)
!53 = !DILocation(line: 54, column: 23, scope: !52)
!54 = !DILocation(line: 54, column: 9, scope: !49)
!55 = !DILocation(line: 56, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 55, column: 9)
!57 = !DILocation(line: 56, column: 23, scope: !56)
!58 = !DILocation(line: 56, column: 13, scope: !56)
!59 = !DILocation(line: 56, column: 18, scope: !56)
!60 = !DILocation(line: 56, column: 21, scope: !56)
!61 = !DILocation(line: 57, column: 9, scope: !56)
!62 = !DILocation(line: 54, column: 31, scope: !52)
!63 = !DILocation(line: 54, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 57, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 59, column: 9, scope: !35)
!68 = !DILocation(line: 59, column: 21, scope: !35)
!69 = !DILocation(line: 60, column: 19, scope: !35)
!70 = !DILocation(line: 60, column: 9, scope: !35)
!71 = !DILocation(line: 62, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_08_good", scope: !14, file: !14, line: 129, type: !15, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 131, column: 5, scope: !72)
!74 = !DILocation(line: 132, column: 5, scope: !72)
!75 = !DILocation(line: 133, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 145, type: !77, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !14, line: 145, type: !79)
!82 = !DILocation(line: 145, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !14, line: 145, type: !80)
!84 = !DILocation(line: 145, column: 27, scope: !76)
!85 = !DILocation(line: 148, column: 22, scope: !76)
!86 = !DILocation(line: 148, column: 12, scope: !76)
!87 = !DILocation(line: 148, column: 5, scope: !76)
!88 = !DILocation(line: 150, column: 5, scope: !76)
!89 = !DILocation(line: 151, column: 5, scope: !76)
!90 = !DILocation(line: 152, column: 5, scope: !76)
!91 = !DILocation(line: 155, column: 5, scope: !76)
!92 = !DILocation(line: 156, column: 5, scope: !76)
!93 = !DILocation(line: 157, column: 5, scope: !76)
!94 = !DILocation(line: 159, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !96, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!79}
!98 = !DILocation(line: 27, column: 5, scope: !95)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 69, type: !15, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !14, line: 71, type: !4)
!101 = !DILocation(line: 71, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !14, line: 72, type: !4)
!103 = !DILocation(line: 72, column: 12, scope: !99)
!104 = !DILocation(line: 72, column: 33, scope: !99)
!105 = !DILocation(line: 73, column: 12, scope: !99)
!106 = !DILocation(line: 73, column: 5, scope: !99)
!107 = !DILocation(line: 74, column: 5, scope: !99)
!108 = !DILocation(line: 74, column: 23, scope: !99)
!109 = !DILocation(line: 75, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !99, file: !14, line: 75, column: 8)
!111 = !DILocation(line: 75, column: 8, scope: !99)
!112 = !DILocation(line: 78, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !14, line: 76, column: 5)
!114 = !DILocation(line: 79, column: 5, scope: !113)
!115 = !DILocation(line: 83, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !14, line: 81, column: 5)
!117 = !DILocation(line: 83, column: 14, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !14, line: 86, type: !36)
!119 = distinct !DILexicalBlock(scope: !99, file: !14, line: 85, column: 5)
!120 = !DILocation(line: 86, column: 16, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !119, file: !14, line: 87, type: !41)
!122 = !DILocation(line: 87, column: 14, scope: !119)
!123 = !DILocation(line: 88, column: 9, scope: !119)
!124 = !DILocation(line: 89, column: 9, scope: !119)
!125 = !DILocation(line: 89, column: 23, scope: !119)
!126 = !DILocation(line: 91, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !119, file: !14, line: 91, column: 9)
!128 = !DILocation(line: 91, column: 14, scope: !127)
!129 = !DILocation(line: 91, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !14, line: 91, column: 9)
!131 = !DILocation(line: 91, column: 23, scope: !130)
!132 = !DILocation(line: 91, column: 9, scope: !127)
!133 = !DILocation(line: 93, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !14, line: 92, column: 9)
!135 = !DILocation(line: 93, column: 23, scope: !134)
!136 = !DILocation(line: 93, column: 13, scope: !134)
!137 = !DILocation(line: 93, column: 18, scope: !134)
!138 = !DILocation(line: 93, column: 21, scope: !134)
!139 = !DILocation(line: 94, column: 9, scope: !134)
!140 = !DILocation(line: 91, column: 31, scope: !130)
!141 = !DILocation(line: 91, column: 9, scope: !130)
!142 = distinct !{!142, !132, !143, !66}
!143 = !DILocation(line: 94, column: 9, scope: !127)
!144 = !DILocation(line: 96, column: 9, scope: !119)
!145 = !DILocation(line: 96, column: 21, scope: !119)
!146 = !DILocation(line: 97, column: 19, scope: !119)
!147 = !DILocation(line: 97, column: 9, scope: !119)
!148 = !DILocation(line: 99, column: 1, scope: !99)
!149 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !96, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocation(line: 32, column: 5, scope: !149)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 102, type: !15, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !14, line: 104, type: !4)
!153 = !DILocation(line: 104, column: 12, scope: !151)
!154 = !DILocalVariable(name: "dataBuffer", scope: !151, file: !14, line: 105, type: !4)
!155 = !DILocation(line: 105, column: 12, scope: !151)
!156 = !DILocation(line: 105, column: 33, scope: !151)
!157 = !DILocation(line: 106, column: 12, scope: !151)
!158 = !DILocation(line: 106, column: 5, scope: !151)
!159 = !DILocation(line: 107, column: 5, scope: !151)
!160 = !DILocation(line: 107, column: 23, scope: !151)
!161 = !DILocation(line: 108, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !151, file: !14, line: 108, column: 8)
!163 = !DILocation(line: 108, column: 8, scope: !151)
!164 = !DILocation(line: 111, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !14, line: 109, column: 5)
!166 = !DILocation(line: 111, column: 14, scope: !165)
!167 = !DILocation(line: 112, column: 5, scope: !165)
!168 = !DILocalVariable(name: "i", scope: !169, file: !14, line: 114, type: !36)
!169 = distinct !DILexicalBlock(scope: !151, file: !14, line: 113, column: 5)
!170 = !DILocation(line: 114, column: 16, scope: !169)
!171 = !DILocalVariable(name: "source", scope: !169, file: !14, line: 115, type: !41)
!172 = !DILocation(line: 115, column: 14, scope: !169)
!173 = !DILocation(line: 116, column: 9, scope: !169)
!174 = !DILocation(line: 117, column: 9, scope: !169)
!175 = !DILocation(line: 117, column: 23, scope: !169)
!176 = !DILocation(line: 119, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !169, file: !14, line: 119, column: 9)
!178 = !DILocation(line: 119, column: 14, scope: !177)
!179 = !DILocation(line: 119, column: 21, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !14, line: 119, column: 9)
!181 = !DILocation(line: 119, column: 23, scope: !180)
!182 = !DILocation(line: 119, column: 9, scope: !177)
!183 = !DILocation(line: 121, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !14, line: 120, column: 9)
!185 = !DILocation(line: 121, column: 23, scope: !184)
!186 = !DILocation(line: 121, column: 13, scope: !184)
!187 = !DILocation(line: 121, column: 18, scope: !184)
!188 = !DILocation(line: 121, column: 21, scope: !184)
!189 = !DILocation(line: 122, column: 9, scope: !184)
!190 = !DILocation(line: 119, column: 31, scope: !180)
!191 = !DILocation(line: 119, column: 9, scope: !180)
!192 = distinct !{!192, !182, !193, !66}
!193 = !DILocation(line: 122, column: 9, scope: !177)
!194 = !DILocation(line: 124, column: 9, scope: !169)
!195 = !DILocation(line: 124, column: 21, scope: !169)
!196 = !DILocation(line: 125, column: 19, scope: !169)
!197 = !DILocation(line: 125, column: 9, scope: !169)
!198 = !DILocation(line: 127, column: 1, scope: !151)
