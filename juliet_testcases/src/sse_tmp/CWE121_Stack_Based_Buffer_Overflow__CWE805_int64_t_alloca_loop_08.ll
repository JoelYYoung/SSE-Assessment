; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08_bad() #0 !dbg !17 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !31
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08_good() #0 !dbg !72 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !97 {
entry:
  ret i32 1, !dbg !100
}

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
  %call = call i32 @staticReturnsFalse(), !dbg !112
  %tobool = icmp ne i32 %call, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !115
  br label %if.end, !dbg !117

if.else:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !118
  store i64* %4, i64** %data, align 8, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !130
  %cmp = icmp ult i64 %6, 100, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !136
  %8 = load i64, i64* %arrayidx, align 8, !dbg !136
  %9 = load i64*, i64** %data, align 8, !dbg !137
  %10 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !137
  store i64 %8, i64* %arrayidx1, align 8, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %11, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !145
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !145
  call void @printLongLongLine(i64 %13), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !148 {
entry:
  ret i32 0, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = alloca i8, i64 400, align 16, !dbg !155
  %1 = bitcast i8* %0 to i64*, !dbg !156
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  %2 = alloca i8, i64 800, align 16, !dbg !159
  %3 = bitcast i8* %2 to i64*, !dbg !160
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !158
  %call = call i32 @staticReturnsTrue(), !dbg !161
  %tobool = icmp ne i32 %call, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %4 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !164
  store i64* %4, i64** %data, align 8, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  %5 = bitcast [100 x i64]* %source to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 800, i1 false), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !177
  %cmp = icmp ult i64 %6, 100, !dbg !179
  br i1 %cmp, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %7, !dbg !183
  %8 = load i64, i64* %arrayidx, align 8, !dbg !183
  %9 = load i64*, i64** %data, align 8, !dbg !184
  %10 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx1 = getelementptr inbounds i64, i64* %9, i64 %10, !dbg !184
  store i64 %8, i64* %arrayidx1, align 8, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %11, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %12 = load i64*, i64** %data, align 8, !dbg !192
  %arrayidx2 = getelementptr inbounds i64, i64* %12, i64 0, !dbg !192
  %13 = load i64, i64* %arrayidx2, align 8, !dbg !192
  call void @printLongLongLine(i64 %13), !dbg !193
  ret void, !dbg !194
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08_bad", scope: !18, file: !18, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08.c", directory: "/root/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 37, type: !4)
!22 = !DILocation(line: 37, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 38, type: !4)
!24 = !DILocation(line: 38, column: 15, scope: !17)
!25 = !DILocation(line: 38, column: 42, scope: !17)
!26 = !DILocation(line: 38, column: 31, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 39, type: !4)
!28 = !DILocation(line: 39, column: 15, scope: !17)
!29 = !DILocation(line: 39, column: 43, scope: !17)
!30 = !DILocation(line: 39, column: 32, scope: !17)
!31 = !DILocation(line: 40, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 8)
!33 = !DILocation(line: 40, column: 8, scope: !17)
!34 = !DILocation(line: 44, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !18, line: 41, column: 5)
!36 = !DILocation(line: 44, column: 14, scope: !35)
!37 = !DILocation(line: 45, column: 5, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !18, line: 47, type: !40)
!39 = distinct !DILexicalBlock(scope: !17, file: !18, line: 46, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 47, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !18, line: 49, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !18, line: 48, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 49, column: 20, scope: !45)
!50 = !DILocation(line: 51, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !45, file: !18, line: 51, column: 13)
!52 = !DILocation(line: 51, column: 18, scope: !51)
!53 = !DILocation(line: 51, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !18, line: 51, column: 13)
!55 = !DILocation(line: 51, column: 27, scope: !54)
!56 = !DILocation(line: 51, column: 13, scope: !51)
!57 = !DILocation(line: 53, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !18, line: 52, column: 13)
!59 = !DILocation(line: 53, column: 27, scope: !58)
!60 = !DILocation(line: 53, column: 17, scope: !58)
!61 = !DILocation(line: 53, column: 22, scope: !58)
!62 = !DILocation(line: 53, column: 25, scope: !58)
!63 = !DILocation(line: 54, column: 13, scope: !58)
!64 = !DILocation(line: 51, column: 35, scope: !54)
!65 = !DILocation(line: 51, column: 13, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 54, column: 13, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 55, column: 31, scope: !45)
!70 = !DILocation(line: 55, column: 13, scope: !45)
!71 = !DILocation(line: 58, column: 1, scope: !17)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_08_good", scope: !18, file: !18, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 121, column: 5, scope: !72)
!74 = !DILocation(line: 122, column: 5, scope: !72)
!75 = !DILocation(line: 123, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 135, type: !77, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !18, line: 135, type: !79)
!84 = !DILocation(line: 135, column: 14, scope: !76)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !18, line: 135, type: !80)
!86 = !DILocation(line: 135, column: 27, scope: !76)
!87 = !DILocation(line: 138, column: 22, scope: !76)
!88 = !DILocation(line: 138, column: 12, scope: !76)
!89 = !DILocation(line: 138, column: 5, scope: !76)
!90 = !DILocation(line: 140, column: 5, scope: !76)
!91 = !DILocation(line: 141, column: 5, scope: !76)
!92 = !DILocation(line: 142, column: 5, scope: !76)
!93 = !DILocation(line: 145, column: 5, scope: !76)
!94 = !DILocation(line: 146, column: 5, scope: !76)
!95 = !DILocation(line: 147, column: 5, scope: !76)
!96 = !DILocation(line: 149, column: 5, scope: !76)
!97 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !18, file: !18, line: 23, type: !98, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!79}
!100 = !DILocation(line: 25, column: 5, scope: !97)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 65, type: !19, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !18, line: 67, type: !4)
!103 = !DILocation(line: 67, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !18, line: 68, type: !4)
!105 = !DILocation(line: 68, column: 15, scope: !101)
!106 = !DILocation(line: 68, column: 42, scope: !101)
!107 = !DILocation(line: 68, column: 31, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !18, line: 69, type: !4)
!109 = !DILocation(line: 69, column: 15, scope: !101)
!110 = !DILocation(line: 69, column: 43, scope: !101)
!111 = !DILocation(line: 69, column: 32, scope: !101)
!112 = !DILocation(line: 70, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !18, line: 70, column: 8)
!114 = !DILocation(line: 70, column: 8, scope: !101)
!115 = !DILocation(line: 73, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !18, line: 71, column: 5)
!117 = !DILocation(line: 74, column: 5, scope: !116)
!118 = !DILocation(line: 78, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !113, file: !18, line: 76, column: 5)
!120 = !DILocation(line: 78, column: 14, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !122, file: !18, line: 81, type: !40)
!122 = distinct !DILexicalBlock(scope: !101, file: !18, line: 80, column: 5)
!123 = !DILocation(line: 81, column: 17, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !125, file: !18, line: 83, type: !46)
!125 = distinct !DILexicalBlock(scope: !122, file: !18, line: 82, column: 9)
!126 = !DILocation(line: 83, column: 20, scope: !125)
!127 = !DILocation(line: 85, column: 20, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !18, line: 85, column: 13)
!129 = !DILocation(line: 85, column: 18, scope: !128)
!130 = !DILocation(line: 85, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !18, line: 85, column: 13)
!132 = !DILocation(line: 85, column: 27, scope: !131)
!133 = !DILocation(line: 85, column: 13, scope: !128)
!134 = !DILocation(line: 87, column: 34, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !18, line: 86, column: 13)
!136 = !DILocation(line: 87, column: 27, scope: !135)
!137 = !DILocation(line: 87, column: 17, scope: !135)
!138 = !DILocation(line: 87, column: 22, scope: !135)
!139 = !DILocation(line: 87, column: 25, scope: !135)
!140 = !DILocation(line: 88, column: 13, scope: !135)
!141 = !DILocation(line: 85, column: 35, scope: !131)
!142 = !DILocation(line: 85, column: 13, scope: !131)
!143 = distinct !{!143, !133, !144, !68}
!144 = !DILocation(line: 88, column: 13, scope: !128)
!145 = !DILocation(line: 89, column: 31, scope: !125)
!146 = !DILocation(line: 89, column: 13, scope: !125)
!147 = !DILocation(line: 92, column: 1, scope: !101)
!148 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !18, file: !18, line: 28, type: !98, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocation(line: 30, column: 5, scope: !148)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 95, type: !19, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", scope: !150, file: !18, line: 97, type: !4)
!152 = !DILocation(line: 97, column: 15, scope: !150)
!153 = !DILocalVariable(name: "dataBadBuffer", scope: !150, file: !18, line: 98, type: !4)
!154 = !DILocation(line: 98, column: 15, scope: !150)
!155 = !DILocation(line: 98, column: 42, scope: !150)
!156 = !DILocation(line: 98, column: 31, scope: !150)
!157 = !DILocalVariable(name: "dataGoodBuffer", scope: !150, file: !18, line: 99, type: !4)
!158 = !DILocation(line: 99, column: 15, scope: !150)
!159 = !DILocation(line: 99, column: 43, scope: !150)
!160 = !DILocation(line: 99, column: 32, scope: !150)
!161 = !DILocation(line: 100, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !150, file: !18, line: 100, column: 8)
!163 = !DILocation(line: 100, column: 8, scope: !150)
!164 = !DILocation(line: 103, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !18, line: 101, column: 5)
!166 = !DILocation(line: 103, column: 14, scope: !165)
!167 = !DILocation(line: 104, column: 5, scope: !165)
!168 = !DILocalVariable(name: "source", scope: !169, file: !18, line: 106, type: !40)
!169 = distinct !DILexicalBlock(scope: !150, file: !18, line: 105, column: 5)
!170 = !DILocation(line: 106, column: 17, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !172, file: !18, line: 108, type: !46)
!172 = distinct !DILexicalBlock(scope: !169, file: !18, line: 107, column: 9)
!173 = !DILocation(line: 108, column: 20, scope: !172)
!174 = !DILocation(line: 110, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !18, line: 110, column: 13)
!176 = !DILocation(line: 110, column: 18, scope: !175)
!177 = !DILocation(line: 110, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !18, line: 110, column: 13)
!179 = !DILocation(line: 110, column: 27, scope: !178)
!180 = !DILocation(line: 110, column: 13, scope: !175)
!181 = !DILocation(line: 112, column: 34, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !18, line: 111, column: 13)
!183 = !DILocation(line: 112, column: 27, scope: !182)
!184 = !DILocation(line: 112, column: 17, scope: !182)
!185 = !DILocation(line: 112, column: 22, scope: !182)
!186 = !DILocation(line: 112, column: 25, scope: !182)
!187 = !DILocation(line: 113, column: 13, scope: !182)
!188 = !DILocation(line: 110, column: 35, scope: !178)
!189 = !DILocation(line: 110, column: 13, scope: !178)
!190 = distinct !{!190, !180, !191, !68}
!191 = !DILocation(line: 113, column: 13, scope: !175)
!192 = !DILocation(line: 114, column: 31, scope: !172)
!193 = !DILocation(line: 114, column: 13, scope: !172)
!194 = !DILocation(line: 117, column: 1, scope: !150)
