; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07_bad() #0 !dbg !22 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to i64*, !dbg !30
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 800, align 16, !dbg !33
  %3 = bitcast i8* %2 to i64*, !dbg !34
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !32
  %4 = load i32, i32* @staticFive, align 4, !dbg !35
  %cmp = icmp eq i32 %4, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !39
  store i64* %5, i64** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !58
  %cmp1 = icmp ult i64 %7, 100, !dbg !60
  br i1 %cmp1, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !64
  %9 = load i64, i64* %arrayidx, align 8, !dbg !64
  %10 = load i64*, i64** %data, align 8, !dbg !65
  %11 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !65
  store i64 %9, i64* %arrayidx2, align 8, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %12, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !74
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !74
  call void @printLongLongLine(i64 %14), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #5, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #5, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 400, align 16, !dbg !106
  %1 = bitcast i8* %0 to i64*, !dbg !107
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %2 = alloca i8, i64 800, align 16, !dbg !110
  %3 = bitcast i8* %2 to i64*, !dbg !111
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !109
  %4 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp ne i32 %4, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !119
  store i64* %5, i64** %data, align 8, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !131
  %cmp1 = icmp ult i64 %7, 100, !dbg !133
  br i1 %cmp1, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !137
  %9 = load i64, i64* %arrayidx, align 8, !dbg !137
  %10 = load i64*, i64** %data, align 8, !dbg !138
  %11 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !138
  store i64 %9, i64* %arrayidx2, align 8, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %12, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !146
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !146
  call void @printLongLongLine(i64 %14), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = alloca i8, i64 400, align 16, !dbg !154
  %1 = bitcast i8* %0 to i64*, !dbg !155
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !153
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %2 = alloca i8, i64 800, align 16, !dbg !158
  %3 = bitcast i8* %2 to i64*, !dbg !159
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !157
  %4 = load i32, i32* @staticFive, align 4, !dbg !160
  %cmp = icmp eq i32 %4, 5, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !164
  store i64* %5, i64** %data, align 8, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !177
  %cmp1 = icmp ult i64 %7, 100, !dbg !179
  br i1 %cmp1, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !183
  %9 = load i64, i64* %arrayidx, align 8, !dbg !183
  %10 = load i64*, i64** %data, align 8, !dbg !184
  %11 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !184
  store i64 %9, i64* %arrayidx2, align 8, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %12, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !192
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !192
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !192
  call void @printLongLongLine(i64 %14), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !14, line: 23, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !12}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 27, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 43, baseType: !11)
!10 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!11 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0}
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07.c", directory: "/root/SSE-Assessment")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07_bad", scope: !14, file: !14, line: 27, type: !23, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !DILocalVariable(name: "data", scope: !22, file: !14, line: 29, type: !6)
!26 = !DILocation(line: 29, column: 15, scope: !22)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !22, file: !14, line: 30, type: !6)
!28 = !DILocation(line: 30, column: 15, scope: !22)
!29 = !DILocation(line: 30, column: 42, scope: !22)
!30 = !DILocation(line: 30, column: 31, scope: !22)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !22, file: !14, line: 31, type: !6)
!32 = !DILocation(line: 31, column: 15, scope: !22)
!33 = !DILocation(line: 31, column: 43, scope: !22)
!34 = !DILocation(line: 31, column: 32, scope: !22)
!35 = !DILocation(line: 32, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !22, file: !14, line: 32, column: 8)
!37 = !DILocation(line: 32, column: 18, scope: !36)
!38 = !DILocation(line: 32, column: 8, scope: !22)
!39 = !DILocation(line: 36, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !14, line: 33, column: 5)
!41 = !DILocation(line: 36, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 5, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !14, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !22, file: !14, line: 38, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 39, column: 17, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !50, file: !14, line: 41, type: !51)
!50 = distinct !DILexicalBlock(scope: !44, file: !14, line: 40, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 41, column: 20, scope: !50)
!55 = !DILocation(line: 43, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !14, line: 43, column: 13)
!57 = !DILocation(line: 43, column: 18, scope: !56)
!58 = !DILocation(line: 43, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !14, line: 43, column: 13)
!60 = !DILocation(line: 43, column: 27, scope: !59)
!61 = !DILocation(line: 43, column: 13, scope: !56)
!62 = !DILocation(line: 45, column: 34, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !14, line: 44, column: 13)
!64 = !DILocation(line: 45, column: 27, scope: !63)
!65 = !DILocation(line: 45, column: 17, scope: !63)
!66 = !DILocation(line: 45, column: 22, scope: !63)
!67 = !DILocation(line: 45, column: 25, scope: !63)
!68 = !DILocation(line: 46, column: 13, scope: !63)
!69 = !DILocation(line: 43, column: 35, scope: !59)
!70 = !DILocation(line: 43, column: 13, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 46, column: 13, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 47, column: 31, scope: !50)
!75 = !DILocation(line: 47, column: 13, scope: !50)
!76 = !DILocation(line: 50, column: 1, scope: !22)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_07_good", scope: !14, file: !14, line: 111, type: !23, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 113, column: 5, scope: !77)
!79 = !DILocation(line: 114, column: 5, scope: !77)
!80 = !DILocation(line: 115, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 127, type: !82, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DISubroutineType(types: !83)
!83 = !{!15, !15, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !14, line: 127, type: !15)
!88 = !DILocation(line: 127, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !14, line: 127, type: !84)
!90 = !DILocation(line: 127, column: 27, scope: !81)
!91 = !DILocation(line: 130, column: 22, scope: !81)
!92 = !DILocation(line: 130, column: 12, scope: !81)
!93 = !DILocation(line: 130, column: 5, scope: !81)
!94 = !DILocation(line: 132, column: 5, scope: !81)
!95 = !DILocation(line: 133, column: 5, scope: !81)
!96 = !DILocation(line: 134, column: 5, scope: !81)
!97 = !DILocation(line: 137, column: 5, scope: !81)
!98 = !DILocation(line: 138, column: 5, scope: !81)
!99 = !DILocation(line: 139, column: 5, scope: !81)
!100 = !DILocation(line: 141, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !23, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 59, type: !6)
!103 = !DILocation(line: 59, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !14, line: 60, type: !6)
!105 = !DILocation(line: 60, column: 15, scope: !101)
!106 = !DILocation(line: 60, column: 42, scope: !101)
!107 = !DILocation(line: 60, column: 31, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !14, line: 61, type: !6)
!109 = !DILocation(line: 61, column: 15, scope: !101)
!110 = !DILocation(line: 61, column: 43, scope: !101)
!111 = !DILocation(line: 61, column: 32, scope: !101)
!112 = !DILocation(line: 62, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !14, line: 62, column: 8)
!114 = !DILocation(line: 62, column: 18, scope: !113)
!115 = !DILocation(line: 62, column: 8, scope: !101)
!116 = !DILocation(line: 65, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !14, line: 63, column: 5)
!118 = !DILocation(line: 66, column: 5, scope: !117)
!119 = !DILocation(line: 70, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !14, line: 68, column: 5)
!121 = !DILocation(line: 70, column: 14, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !123, file: !14, line: 73, type: !45)
!123 = distinct !DILexicalBlock(scope: !101, file: !14, line: 72, column: 5)
!124 = !DILocation(line: 73, column: 17, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !14, line: 75, type: !51)
!126 = distinct !DILexicalBlock(scope: !123, file: !14, line: 74, column: 9)
!127 = !DILocation(line: 75, column: 20, scope: !126)
!128 = !DILocation(line: 77, column: 20, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !14, line: 77, column: 13)
!130 = !DILocation(line: 77, column: 18, scope: !129)
!131 = !DILocation(line: 77, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !14, line: 77, column: 13)
!133 = !DILocation(line: 77, column: 27, scope: !132)
!134 = !DILocation(line: 77, column: 13, scope: !129)
!135 = !DILocation(line: 79, column: 34, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !14, line: 78, column: 13)
!137 = !DILocation(line: 79, column: 27, scope: !136)
!138 = !DILocation(line: 79, column: 17, scope: !136)
!139 = !DILocation(line: 79, column: 22, scope: !136)
!140 = !DILocation(line: 79, column: 25, scope: !136)
!141 = !DILocation(line: 80, column: 13, scope: !136)
!142 = !DILocation(line: 77, column: 35, scope: !132)
!143 = !DILocation(line: 77, column: 13, scope: !132)
!144 = distinct !{!144, !134, !145, !73}
!145 = !DILocation(line: 80, column: 13, scope: !129)
!146 = !DILocation(line: 81, column: 31, scope: !126)
!147 = !DILocation(line: 81, column: 13, scope: !126)
!148 = !DILocation(line: 84, column: 1, scope: !101)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 87, type: !23, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "data", scope: !149, file: !14, line: 89, type: !6)
!151 = !DILocation(line: 89, column: 15, scope: !149)
!152 = !DILocalVariable(name: "dataBadBuffer", scope: !149, file: !14, line: 90, type: !6)
!153 = !DILocation(line: 90, column: 15, scope: !149)
!154 = !DILocation(line: 90, column: 42, scope: !149)
!155 = !DILocation(line: 90, column: 31, scope: !149)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !149, file: !14, line: 91, type: !6)
!157 = !DILocation(line: 91, column: 15, scope: !149)
!158 = !DILocation(line: 91, column: 43, scope: !149)
!159 = !DILocation(line: 91, column: 32, scope: !149)
!160 = !DILocation(line: 92, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !149, file: !14, line: 92, column: 8)
!162 = !DILocation(line: 92, column: 18, scope: !161)
!163 = !DILocation(line: 92, column: 8, scope: !149)
!164 = !DILocation(line: 95, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !14, line: 93, column: 5)
!166 = !DILocation(line: 95, column: 14, scope: !165)
!167 = !DILocation(line: 96, column: 5, scope: !165)
!168 = !DILocalVariable(name: "source", scope: !169, file: !14, line: 98, type: !45)
!169 = distinct !DILexicalBlock(scope: !149, file: !14, line: 97, column: 5)
!170 = !DILocation(line: 98, column: 17, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !172, file: !14, line: 100, type: !51)
!172 = distinct !DILexicalBlock(scope: !169, file: !14, line: 99, column: 9)
!173 = !DILocation(line: 100, column: 20, scope: !172)
!174 = !DILocation(line: 102, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !14, line: 102, column: 13)
!176 = !DILocation(line: 102, column: 18, scope: !175)
!177 = !DILocation(line: 102, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !14, line: 102, column: 13)
!179 = !DILocation(line: 102, column: 27, scope: !178)
!180 = !DILocation(line: 102, column: 13, scope: !175)
!181 = !DILocation(line: 104, column: 34, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !14, line: 103, column: 13)
!183 = !DILocation(line: 104, column: 27, scope: !182)
!184 = !DILocation(line: 104, column: 17, scope: !182)
!185 = !DILocation(line: 104, column: 22, scope: !182)
!186 = !DILocation(line: 104, column: 25, scope: !182)
!187 = !DILocation(line: 105, column: 13, scope: !182)
!188 = !DILocation(line: 102, column: 35, scope: !178)
!189 = !DILocation(line: 102, column: 13, scope: !178)
!190 = distinct !{!190, !180, !191, !73}
!191 = !DILocation(line: 105, column: 13, scope: !175)
!192 = !DILocation(line: 106, column: 31, scope: !172)
!193 = !DILocation(line: 106, column: 13, scope: !172)
!194 = !DILocation(line: 109, column: 1, scope: !149)
