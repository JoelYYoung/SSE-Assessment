; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_bad() #0 !dbg !17 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataBadBuffer, align 8, !dbg !34
  store i64* %4, i64** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %6, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !59
  %8 = load i64, i64* %arrayidx, align 8, !dbg !59
  %9 = load i64*, i64** %data, align 8, !dbg !60
  %10 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !60
  store i64 %8, i64* %arrayidx1, align 8, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %11, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !69
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !69
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !69
  call void @printLongLongLine(i64 %13), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @printLongLongLine(i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_good() #0 !dbg !72 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 400, align 16, !dbg !102
  %1 = bitcast i8* %0 to i64*, !dbg !103
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %2 = alloca i8, i64 800, align 16, !dbg !106
  %3 = bitcast i8* %2 to i64*, !dbg !107
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !105
  %call = call i32 (...) @globalReturnsFalse(), !dbg !108
  %tobool = icmp ne i32 %call, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !114
  store i64* %4, i64** %data, align 8, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %6, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !132
  %8 = load i64, i64* %arrayidx, align 8, !dbg !132
  %9 = load i64*, i64** %data, align 8, !dbg !133
  %10 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !133
  store i64 %8, i64* %arrayidx1, align 8, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %11, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !141
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !141
  call void @printLongLongLine(i64 %13), !dbg !142
  ret void, !dbg !143
}

declare dso_local i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = alloca i8, i64 400, align 16, !dbg !149
  %1 = bitcast i8* %0 to i64*, !dbg !150
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = alloca i8, i64 800, align 16, !dbg !153
  %3 = bitcast i8* %2 to i64*, !dbg !154
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !152
  %call = call i32 (...) @globalReturnsTrue(), !dbg !155
  %tobool = icmp ne i32 %call, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !158
  store i64* %4, i64** %data, align 8, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !162, metadata !DIExpression()), !dbg !164
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !167
  store i64 0, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !171
  %cmp = icmp ult i64 %6, 100, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !177
  %8 = load i64, i64* %arrayidx, align 8, !dbg !177
  %9 = load i64*, i64** %data, align 8, !dbg !178
  %10 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !178
  store i64 %8, i64* %arrayidx1, align 8, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !182
  %inc = add i64 %11, 1, !dbg !182
  store i64 %inc, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !186
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !186
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !186
  call void @printLongLongLine(i64 %13), !dbg !187
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_bad", scope: !18, file: !18, line: 21, type: !19, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
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
!33 = !DILocation(line: 26, column: 8, scope: !17)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !18, line: 27, column: 5)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 5, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !18, line: 33, type: !40)
!39 = distinct !DILexicalBlock(scope: !17, file: !18, line: 32, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 33, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !18, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !18, line: 34, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 35, column: 20, scope: !45)
!50 = !DILocation(line: 37, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !18, line: 37, column: 13)
!52 = !DILocation(line: 37, column: 18, scope: !51)
!53 = !DILocation(line: 37, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !18, line: 37, column: 13)
!55 = !DILocation(line: 37, column: 27, scope: !54)
!56 = !DILocation(line: 37, column: 13, scope: !51)
!57 = !DILocation(line: 39, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !18, line: 38, column: 13)
!59 = !DILocation(line: 39, column: 27, scope: !58)
!60 = !DILocation(line: 39, column: 17, scope: !58)
!61 = !DILocation(line: 39, column: 22, scope: !58)
!62 = !DILocation(line: 39, column: 25, scope: !58)
!63 = !DILocation(line: 40, column: 13, scope: !58)
!64 = !DILocation(line: 37, column: 35, scope: !54)
!65 = !DILocation(line: 37, column: 13, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 40, column: 13, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 41, column: 31, scope: !45)
!70 = !DILocation(line: 41, column: 13, scope: !45)
!71 = !DILocation(line: 44, column: 1, scope: !17)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_11_good", scope: !18, file: !18, line: 105, type: !19, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 107, column: 5, scope: !72)
!74 = !DILocation(line: 108, column: 5, scope: !72)
!75 = !DILocation(line: 109, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 121, type: !77, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !18, line: 121, type: !79)
!84 = !DILocation(line: 121, column: 14, scope: !76)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !18, line: 121, type: !80)
!86 = !DILocation(line: 121, column: 27, scope: !76)
!87 = !DILocation(line: 124, column: 22, scope: !76)
!88 = !DILocation(line: 124, column: 12, scope: !76)
!89 = !DILocation(line: 124, column: 5, scope: !76)
!90 = !DILocation(line: 126, column: 5, scope: !76)
!91 = !DILocation(line: 127, column: 5, scope: !76)
!92 = !DILocation(line: 128, column: 5, scope: !76)
!93 = !DILocation(line: 131, column: 5, scope: !76)
!94 = !DILocation(line: 132, column: 5, scope: !76)
!95 = !DILocation(line: 133, column: 5, scope: !76)
!96 = !DILocation(line: 135, column: 5, scope: !76)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !18, line: 53, type: !4)
!99 = !DILocation(line: 53, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !18, line: 54, type: !4)
!101 = !DILocation(line: 54, column: 15, scope: !97)
!102 = !DILocation(line: 54, column: 42, scope: !97)
!103 = !DILocation(line: 54, column: 31, scope: !97)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !18, line: 55, type: !4)
!105 = !DILocation(line: 55, column: 15, scope: !97)
!106 = !DILocation(line: 55, column: 43, scope: !97)
!107 = !DILocation(line: 55, column: 32, scope: !97)
!108 = !DILocation(line: 56, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !97, file: !18, line: 56, column: 8)
!110 = !DILocation(line: 56, column: 8, scope: !97)
!111 = !DILocation(line: 59, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !18, line: 57, column: 5)
!113 = !DILocation(line: 60, column: 5, scope: !112)
!114 = !DILocation(line: 64, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !18, line: 62, column: 5)
!116 = !DILocation(line: 64, column: 14, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !118, file: !18, line: 67, type: !40)
!118 = distinct !DILexicalBlock(scope: !97, file: !18, line: 66, column: 5)
!119 = !DILocation(line: 67, column: 17, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !18, line: 69, type: !46)
!121 = distinct !DILexicalBlock(scope: !118, file: !18, line: 68, column: 9)
!122 = !DILocation(line: 69, column: 20, scope: !121)
!123 = !DILocation(line: 71, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !18, line: 71, column: 13)
!125 = !DILocation(line: 71, column: 18, scope: !124)
!126 = !DILocation(line: 71, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !18, line: 71, column: 13)
!128 = !DILocation(line: 71, column: 27, scope: !127)
!129 = !DILocation(line: 71, column: 13, scope: !124)
!130 = !DILocation(line: 73, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !18, line: 72, column: 13)
!132 = !DILocation(line: 73, column: 27, scope: !131)
!133 = !DILocation(line: 73, column: 17, scope: !131)
!134 = !DILocation(line: 73, column: 22, scope: !131)
!135 = !DILocation(line: 73, column: 25, scope: !131)
!136 = !DILocation(line: 74, column: 13, scope: !131)
!137 = !DILocation(line: 71, column: 35, scope: !127)
!138 = !DILocation(line: 71, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !68}
!140 = !DILocation(line: 74, column: 13, scope: !124)
!141 = !DILocation(line: 75, column: 31, scope: !121)
!142 = !DILocation(line: 75, column: 13, scope: !121)
!143 = !DILocation(line: 78, column: 1, scope: !97)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 81, type: !19, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!145 = !DILocalVariable(name: "data", scope: !144, file: !18, line: 83, type: !4)
!146 = !DILocation(line: 83, column: 15, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !18, line: 84, type: !4)
!148 = !DILocation(line: 84, column: 15, scope: !144)
!149 = !DILocation(line: 84, column: 42, scope: !144)
!150 = !DILocation(line: 84, column: 31, scope: !144)
!151 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !18, line: 85, type: !4)
!152 = !DILocation(line: 85, column: 15, scope: !144)
!153 = !DILocation(line: 85, column: 43, scope: !144)
!154 = !DILocation(line: 85, column: 32, scope: !144)
!155 = !DILocation(line: 86, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !144, file: !18, line: 86, column: 8)
!157 = !DILocation(line: 86, column: 8, scope: !144)
!158 = !DILocation(line: 89, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !18, line: 87, column: 5)
!160 = !DILocation(line: 89, column: 14, scope: !159)
!161 = !DILocation(line: 90, column: 5, scope: !159)
!162 = !DILocalVariable(name: "source", scope: !163, file: !18, line: 92, type: !40)
!163 = distinct !DILexicalBlock(scope: !144, file: !18, line: 91, column: 5)
!164 = !DILocation(line: 92, column: 17, scope: !163)
!165 = !DILocalVariable(name: "i", scope: !166, file: !18, line: 94, type: !46)
!166 = distinct !DILexicalBlock(scope: !163, file: !18, line: 93, column: 9)
!167 = !DILocation(line: 94, column: 20, scope: !166)
!168 = !DILocation(line: 96, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !18, line: 96, column: 13)
!170 = !DILocation(line: 96, column: 18, scope: !169)
!171 = !DILocation(line: 96, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !18, line: 96, column: 13)
!173 = !DILocation(line: 96, column: 27, scope: !172)
!174 = !DILocation(line: 96, column: 13, scope: !169)
!175 = !DILocation(line: 98, column: 34, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !18, line: 97, column: 13)
!177 = !DILocation(line: 98, column: 27, scope: !176)
!178 = !DILocation(line: 98, column: 17, scope: !176)
!179 = !DILocation(line: 98, column: 22, scope: !176)
!180 = !DILocation(line: 98, column: 25, scope: !176)
!181 = !DILocation(line: 99, column: 13, scope: !176)
!182 = !DILocation(line: 96, column: 35, scope: !172)
!183 = !DILocation(line: 96, column: 13, scope: !172)
!184 = distinct !{!184, !174, !185, !68}
!185 = !DILocation(line: 99, column: 13, scope: !169)
!186 = !DILocation(line: 100, column: 31, scope: !166)
!187 = !DILocation(line: 100, column: 13, scope: !166)
!188 = !DILocation(line: 103, column: 1, scope: !144)
