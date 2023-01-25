; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 400, align 16, !dbg !25
  %1 = bitcast i8* %0 to i64*, !dbg !26
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 800, align 16, !dbg !29
  %3 = bitcast i8* %2 to i64*, !dbg !30
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !28
  %4 = load i32, i32* @globalFive, align 4, !dbg !31
  %cmp = icmp eq i32 %4, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !35
  store i64* %5, i64** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !54
  %cmp1 = icmp ult i64 %7, 100, !dbg !56
  br i1 %cmp1, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !60
  %9 = load i64, i64* %arrayidx, align 8, !dbg !60
  %10 = load i64*, i64** %data, align 8, !dbg !61
  %11 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !61
  store i64 %9, i64* %arrayidx2, align 8, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %12, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !70
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !70
  call void @printLongLongLine(i64 %14), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_good() #0 !dbg !73 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 400, align 16, !dbg !103
  %1 = bitcast i8* %0 to i64*, !dbg !104
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %2 = alloca i8, i64 800, align 16, !dbg !107
  %3 = bitcast i8* %2 to i64*, !dbg !108
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !106
  %4 = load i32, i32* @globalFive, align 4, !dbg !109
  %cmp = icmp ne i32 %4, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !116
  store i64* %5, i64** %data, align 8, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !128
  %cmp1 = icmp ult i64 %7, 100, !dbg !130
  br i1 %cmp1, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !134
  %9 = load i64, i64* %arrayidx, align 8, !dbg !134
  %10 = load i64*, i64** %data, align 8, !dbg !135
  %11 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !135
  store i64 %9, i64* %arrayidx2, align 8, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %12, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !143
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !143
  call void @printLongLongLine(i64 %14), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %0 = alloca i8, i64 400, align 16, !dbg !151
  %1 = bitcast i8* %0 to i64*, !dbg !152
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !150
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %2 = alloca i8, i64 800, align 16, !dbg !155
  %3 = bitcast i8* %2 to i64*, !dbg !156
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !154
  %4 = load i32, i32* @globalFive, align 4, !dbg !157
  %cmp = icmp eq i32 %4, 5, !dbg !159
  br i1 %cmp, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !161
  store i64* %5, i64** %data, align 8, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !165, metadata !DIExpression()), !dbg !167
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !167
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !174
  %cmp1 = icmp ult i64 %7, 100, !dbg !176
  br i1 %cmp1, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !180
  %9 = load i64, i64* %arrayidx, align 8, !dbg !180
  %10 = load i64*, i64** %data, align 8, !dbg !181
  %11 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !181
  store i64 %9, i64* %arrayidx2, align 8, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %12, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !189
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !189
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !189
  call void @printLongLongLine(i64 %14), !dbg !190
  ret void, !dbg !191
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 23, type: !4)
!22 = !DILocation(line: 23, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 24, type: !4)
!24 = !DILocation(line: 24, column: 15, scope: !17)
!25 = !DILocation(line: 24, column: 42, scope: !17)
!26 = !DILocation(line: 24, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 25, type: !4)
!28 = !DILocation(line: 25, column: 15, scope: !17)
!29 = !DILocation(line: 25, column: 43, scope: !17)
!30 = !DILocation(line: 25, column: 32, scope: !17)
!31 = !DILocation(line: 26, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !18, line: 26, column: 8)
!33 = !DILocation(line: 26, column: 18, scope: !32)
!34 = !DILocation(line: 26, column: 8, scope: !17)
!35 = !DILocation(line: 30, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !18, line: 27, column: 5)
!37 = !DILocation(line: 30, column: 14, scope: !36)
!38 = !DILocation(line: 31, column: 5, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !18, line: 33, type: !41)
!40 = distinct !DILexicalBlock(scope: !17, file: !18, line: 32, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 33, column: 17, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !18, line: 35, type: !47)
!46 = distinct !DILexicalBlock(scope: !40, file: !18, line: 34, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 20, scope: !46)
!51 = !DILocation(line: 37, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !18, line: 37, column: 13)
!53 = !DILocation(line: 37, column: 18, scope: !52)
!54 = !DILocation(line: 37, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !18, line: 37, column: 13)
!56 = !DILocation(line: 37, column: 27, scope: !55)
!57 = !DILocation(line: 37, column: 13, scope: !52)
!58 = !DILocation(line: 39, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !18, line: 38, column: 13)
!60 = !DILocation(line: 39, column: 27, scope: !59)
!61 = !DILocation(line: 39, column: 17, scope: !59)
!62 = !DILocation(line: 39, column: 22, scope: !59)
!63 = !DILocation(line: 39, column: 25, scope: !59)
!64 = !DILocation(line: 40, column: 13, scope: !59)
!65 = !DILocation(line: 37, column: 35, scope: !55)
!66 = !DILocation(line: 37, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 40, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 41, column: 31, scope: !46)
!71 = !DILocation(line: 41, column: 13, scope: !46)
!72 = !DILocation(line: 44, column: 1, scope: !17)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_good", scope: !18, file: !18, line: 105, type: !19, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 107, column: 5, scope: !73)
!75 = !DILocation(line: 108, column: 5, scope: !73)
!76 = !DILocation(line: 109, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 121, type: !78, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !18, line: 121, type: !80)
!85 = !DILocation(line: 121, column: 14, scope: !77)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !18, line: 121, type: !81)
!87 = !DILocation(line: 121, column: 27, scope: !77)
!88 = !DILocation(line: 124, column: 22, scope: !77)
!89 = !DILocation(line: 124, column: 12, scope: !77)
!90 = !DILocation(line: 124, column: 5, scope: !77)
!91 = !DILocation(line: 126, column: 5, scope: !77)
!92 = !DILocation(line: 127, column: 5, scope: !77)
!93 = !DILocation(line: 128, column: 5, scope: !77)
!94 = !DILocation(line: 131, column: 5, scope: !77)
!95 = !DILocation(line: 132, column: 5, scope: !77)
!96 = !DILocation(line: 133, column: 5, scope: !77)
!97 = !DILocation(line: 135, column: 5, scope: !77)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !18, line: 53, type: !4)
!100 = !DILocation(line: 53, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !18, line: 54, type: !4)
!102 = !DILocation(line: 54, column: 15, scope: !98)
!103 = !DILocation(line: 54, column: 42, scope: !98)
!104 = !DILocation(line: 54, column: 31, scope: !98)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !18, line: 55, type: !4)
!106 = !DILocation(line: 55, column: 15, scope: !98)
!107 = !DILocation(line: 55, column: 43, scope: !98)
!108 = !DILocation(line: 55, column: 32, scope: !98)
!109 = !DILocation(line: 56, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !98, file: !18, line: 56, column: 8)
!111 = !DILocation(line: 56, column: 18, scope: !110)
!112 = !DILocation(line: 56, column: 8, scope: !98)
!113 = !DILocation(line: 59, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !18, line: 57, column: 5)
!115 = !DILocation(line: 60, column: 5, scope: !114)
!116 = !DILocation(line: 64, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !18, line: 62, column: 5)
!118 = !DILocation(line: 64, column: 14, scope: !117)
!119 = !DILocalVariable(name: "source", scope: !120, file: !18, line: 67, type: !41)
!120 = distinct !DILexicalBlock(scope: !98, file: !18, line: 66, column: 5)
!121 = !DILocation(line: 67, column: 17, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !123, file: !18, line: 69, type: !47)
!123 = distinct !DILexicalBlock(scope: !120, file: !18, line: 68, column: 9)
!124 = !DILocation(line: 69, column: 20, scope: !123)
!125 = !DILocation(line: 71, column: 20, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !18, line: 71, column: 13)
!127 = !DILocation(line: 71, column: 18, scope: !126)
!128 = !DILocation(line: 71, column: 25, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !18, line: 71, column: 13)
!130 = !DILocation(line: 71, column: 27, scope: !129)
!131 = !DILocation(line: 71, column: 13, scope: !126)
!132 = !DILocation(line: 73, column: 34, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !18, line: 72, column: 13)
!134 = !DILocation(line: 73, column: 27, scope: !133)
!135 = !DILocation(line: 73, column: 17, scope: !133)
!136 = !DILocation(line: 73, column: 22, scope: !133)
!137 = !DILocation(line: 73, column: 25, scope: !133)
!138 = !DILocation(line: 74, column: 13, scope: !133)
!139 = !DILocation(line: 71, column: 35, scope: !129)
!140 = !DILocation(line: 71, column: 13, scope: !129)
!141 = distinct !{!141, !131, !142, !69}
!142 = !DILocation(line: 74, column: 13, scope: !126)
!143 = !DILocation(line: 75, column: 31, scope: !123)
!144 = !DILocation(line: 75, column: 13, scope: !123)
!145 = !DILocation(line: 78, column: 1, scope: !98)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 81, type: !19, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!147 = !DILocalVariable(name: "data", scope: !146, file: !18, line: 83, type: !4)
!148 = !DILocation(line: 83, column: 15, scope: !146)
!149 = !DILocalVariable(name: "dataBadBuffer", scope: !146, file: !18, line: 84, type: !4)
!150 = !DILocation(line: 84, column: 15, scope: !146)
!151 = !DILocation(line: 84, column: 42, scope: !146)
!152 = !DILocation(line: 84, column: 31, scope: !146)
!153 = !DILocalVariable(name: "dataGoodBuffer", scope: !146, file: !18, line: 85, type: !4)
!154 = !DILocation(line: 85, column: 15, scope: !146)
!155 = !DILocation(line: 85, column: 43, scope: !146)
!156 = !DILocation(line: 85, column: 32, scope: !146)
!157 = !DILocation(line: 86, column: 8, scope: !158)
!158 = distinct !DILexicalBlock(scope: !146, file: !18, line: 86, column: 8)
!159 = !DILocation(line: 86, column: 18, scope: !158)
!160 = !DILocation(line: 86, column: 8, scope: !146)
!161 = !DILocation(line: 89, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !18, line: 87, column: 5)
!163 = !DILocation(line: 89, column: 14, scope: !162)
!164 = !DILocation(line: 90, column: 5, scope: !162)
!165 = !DILocalVariable(name: "source", scope: !166, file: !18, line: 92, type: !41)
!166 = distinct !DILexicalBlock(scope: !146, file: !18, line: 91, column: 5)
!167 = !DILocation(line: 92, column: 17, scope: !166)
!168 = !DILocalVariable(name: "i", scope: !169, file: !18, line: 94, type: !47)
!169 = distinct !DILexicalBlock(scope: !166, file: !18, line: 93, column: 9)
!170 = !DILocation(line: 94, column: 20, scope: !169)
!171 = !DILocation(line: 96, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !18, line: 96, column: 13)
!173 = !DILocation(line: 96, column: 18, scope: !172)
!174 = !DILocation(line: 96, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !18, line: 96, column: 13)
!176 = !DILocation(line: 96, column: 27, scope: !175)
!177 = !DILocation(line: 96, column: 13, scope: !172)
!178 = !DILocation(line: 98, column: 34, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !18, line: 97, column: 13)
!180 = !DILocation(line: 98, column: 27, scope: !179)
!181 = !DILocation(line: 98, column: 17, scope: !179)
!182 = !DILocation(line: 98, column: 22, scope: !179)
!183 = !DILocation(line: 98, column: 25, scope: !179)
!184 = !DILocation(line: 99, column: 13, scope: !179)
!185 = !DILocation(line: 96, column: 35, scope: !175)
!186 = !DILocation(line: 96, column: 13, scope: !175)
!187 = distinct !{!187, !177, !188, !69}
!188 = !DILocation(line: 99, column: 13, scope: !172)
!189 = !DILocation(line: 100, column: 31, scope: !169)
!190 = !DILocation(line: 100, column: 13, scope: !169)
!191 = !DILocation(line: 103, column: 1, scope: !146)
