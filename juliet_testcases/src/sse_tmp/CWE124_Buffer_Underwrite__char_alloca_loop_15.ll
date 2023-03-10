; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_15.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_15_bad() #0 !dbg !13 {
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
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !27
  store i8* %add.ptr, i8** %data, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  store i64 0, i64* %i, align 8, !dbg !43
  br label %for.cond, !dbg !45

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !46
  %cmp = icmp ult i64 %4, 100, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !52
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !52
  %7 = load i8*, i8** %data, align 8, !dbg !53
  %8 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !53
  store i8 %6, i8* %arrayidx3, align 1, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %9, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !62
  store i8 0, i8* %arrayidx4, align 1, !dbg !63
  %11 = load i8*, i8** %data, align 8, !dbg !64
  call void @printLine(i8* %11), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_alloca_loop_15_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_15_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE124_Buffer_Underwrite__char_alloca_loop_15_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 100, align 16, !dbg !95
  store i8* %0, i8** %dataBuffer, align 8, !dbg !94
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !97
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !100
  store i8* %3, i8** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i64* %i, metadata !102, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx1, align 1, !dbg !109
  store i64 0, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !112

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !113
  %cmp = icmp ult i64 %4, 100, !dbg !115
  br i1 %cmp, label %for.body, label %for.end, !dbg !116

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !117
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !119
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !119
  %7 = load i8*, i8** %data, align 8, !dbg !120
  %8 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !120
  store i8 %6, i8* %arrayidx3, align 1, !dbg !122
  br label %for.inc, !dbg !123

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !124
  %inc = add i64 %9, 1, !dbg !124
  store i64 %inc, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !125, !llvm.loop !126

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !128
  store i8 0, i8* %arrayidx4, align 1, !dbg !129
  %11 = load i8*, i8** %data, align 8, !dbg !130
  call void @printLine(i8* %11), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = alloca i8, i64 100, align 16, !dbg !138
  store i8* %0, i8** %dataBuffer, align 8, !dbg !137
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !139
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !140
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !141
  store i8 0, i8* %arrayidx, align 1, !dbg !142
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !143
  store i8* %3, i8** %data, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !150
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !151
  store i8 0, i8* %arrayidx1, align 1, !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !156
  %cmp = icmp ult i64 %4, 100, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !162
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !162
  %7 = load i8*, i8** %data, align 8, !dbg !163
  %8 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !163
  store i8 %6, i8* %arrayidx3, align 1, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %9, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !171
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !171
  store i8 0, i8* %arrayidx4, align 1, !dbg !172
  %11 = load i8*, i8** %data, align 8, !dbg !173
  call void @printLine(i8* %11), !dbg !174
  ret void, !dbg !175
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_alloca_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!26 = !DILocation(line: 33, column: 16, scope: !13)
!27 = !DILocation(line: 33, column: 27, scope: !13)
!28 = !DILocation(line: 33, column: 14, scope: !13)
!29 = !DILocalVariable(name: "i", scope: !30, file: !14, line: 41, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 46, baseType: !33)
!32 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!33 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!34 = !DILocation(line: 41, column: 16, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 42, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 42, column: 14, scope: !30)
!40 = !DILocation(line: 43, column: 9, scope: !30)
!41 = !DILocation(line: 44, column: 9, scope: !30)
!42 = !DILocation(line: 44, column: 23, scope: !30)
!43 = !DILocation(line: 46, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !30, file: !14, line: 46, column: 9)
!45 = !DILocation(line: 46, column: 14, scope: !44)
!46 = !DILocation(line: 46, column: 21, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !14, line: 46, column: 9)
!48 = !DILocation(line: 46, column: 23, scope: !47)
!49 = !DILocation(line: 46, column: 9, scope: !44)
!50 = !DILocation(line: 48, column: 30, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !14, line: 47, column: 9)
!52 = !DILocation(line: 48, column: 23, scope: !51)
!53 = !DILocation(line: 48, column: 13, scope: !51)
!54 = !DILocation(line: 48, column: 18, scope: !51)
!55 = !DILocation(line: 48, column: 21, scope: !51)
!56 = !DILocation(line: 49, column: 9, scope: !51)
!57 = !DILocation(line: 46, column: 31, scope: !47)
!58 = !DILocation(line: 46, column: 9, scope: !47)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 49, column: 9, scope: !44)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 51, column: 9, scope: !30)
!63 = !DILocation(line: 51, column: 21, scope: !30)
!64 = !DILocation(line: 52, column: 19, scope: !30)
!65 = !DILocation(line: 52, column: 9, scope: !30)
!66 = !DILocation(line: 54, column: 1, scope: !13)
!67 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_alloca_loop_15_good", scope: !14, file: !14, line: 128, type: !15, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 130, column: 5, scope: !67)
!69 = !DILocation(line: 131, column: 5, scope: !67)
!70 = !DILocation(line: 132, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 144, type: !72, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !14, line: 144, type: !74)
!77 = !DILocation(line: 144, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !14, line: 144, type: !75)
!79 = !DILocation(line: 144, column: 27, scope: !71)
!80 = !DILocation(line: 147, column: 22, scope: !71)
!81 = !DILocation(line: 147, column: 12, scope: !71)
!82 = !DILocation(line: 147, column: 5, scope: !71)
!83 = !DILocation(line: 149, column: 5, scope: !71)
!84 = !DILocation(line: 150, column: 5, scope: !71)
!85 = !DILocation(line: 151, column: 5, scope: !71)
!86 = !DILocation(line: 154, column: 5, scope: !71)
!87 = !DILocation(line: 155, column: 5, scope: !71)
!88 = !DILocation(line: 156, column: 5, scope: !71)
!89 = !DILocation(line: 158, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !14, line: 63, type: !4)
!92 = !DILocation(line: 63, column: 12, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !14, line: 64, type: !4)
!94 = !DILocation(line: 64, column: 12, scope: !90)
!95 = !DILocation(line: 64, column: 33, scope: !90)
!96 = !DILocation(line: 65, column: 12, scope: !90)
!97 = !DILocation(line: 65, column: 5, scope: !90)
!98 = !DILocation(line: 66, column: 5, scope: !90)
!99 = !DILocation(line: 66, column: 23, scope: !90)
!100 = !DILocation(line: 75, column: 16, scope: !90)
!101 = !DILocation(line: 75, column: 14, scope: !90)
!102 = !DILocalVariable(name: "i", scope: !103, file: !14, line: 79, type: !31)
!103 = distinct !DILexicalBlock(scope: !90, file: !14, line: 78, column: 5)
!104 = !DILocation(line: 79, column: 16, scope: !103)
!105 = !DILocalVariable(name: "source", scope: !103, file: !14, line: 80, type: !36)
!106 = !DILocation(line: 80, column: 14, scope: !103)
!107 = !DILocation(line: 81, column: 9, scope: !103)
!108 = !DILocation(line: 82, column: 9, scope: !103)
!109 = !DILocation(line: 82, column: 23, scope: !103)
!110 = !DILocation(line: 84, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !14, line: 84, column: 9)
!112 = !DILocation(line: 84, column: 14, scope: !111)
!113 = !DILocation(line: 84, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 84, column: 9)
!115 = !DILocation(line: 84, column: 23, scope: !114)
!116 = !DILocation(line: 84, column: 9, scope: !111)
!117 = !DILocation(line: 86, column: 30, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !14, line: 85, column: 9)
!119 = !DILocation(line: 86, column: 23, scope: !118)
!120 = !DILocation(line: 86, column: 13, scope: !118)
!121 = !DILocation(line: 86, column: 18, scope: !118)
!122 = !DILocation(line: 86, column: 21, scope: !118)
!123 = !DILocation(line: 87, column: 9, scope: !118)
!124 = !DILocation(line: 84, column: 31, scope: !114)
!125 = !DILocation(line: 84, column: 9, scope: !114)
!126 = distinct !{!126, !116, !127, !61}
!127 = !DILocation(line: 87, column: 9, scope: !111)
!128 = !DILocation(line: 89, column: 9, scope: !103)
!129 = !DILocation(line: 89, column: 21, scope: !103)
!130 = !DILocation(line: 90, column: 19, scope: !103)
!131 = !DILocation(line: 90, column: 9, scope: !103)
!132 = !DILocation(line: 92, column: 1, scope: !90)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 95, type: !15, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocalVariable(name: "data", scope: !133, file: !14, line: 97, type: !4)
!135 = !DILocation(line: 97, column: 12, scope: !133)
!136 = !DILocalVariable(name: "dataBuffer", scope: !133, file: !14, line: 98, type: !4)
!137 = !DILocation(line: 98, column: 12, scope: !133)
!138 = !DILocation(line: 98, column: 33, scope: !133)
!139 = !DILocation(line: 99, column: 12, scope: !133)
!140 = !DILocation(line: 99, column: 5, scope: !133)
!141 = !DILocation(line: 100, column: 5, scope: !133)
!142 = !DILocation(line: 100, column: 23, scope: !133)
!143 = !DILocation(line: 105, column: 16, scope: !133)
!144 = !DILocation(line: 105, column: 14, scope: !133)
!145 = !DILocalVariable(name: "i", scope: !146, file: !14, line: 113, type: !31)
!146 = distinct !DILexicalBlock(scope: !133, file: !14, line: 112, column: 5)
!147 = !DILocation(line: 113, column: 16, scope: !146)
!148 = !DILocalVariable(name: "source", scope: !146, file: !14, line: 114, type: !36)
!149 = !DILocation(line: 114, column: 14, scope: !146)
!150 = !DILocation(line: 115, column: 9, scope: !146)
!151 = !DILocation(line: 116, column: 9, scope: !146)
!152 = !DILocation(line: 116, column: 23, scope: !146)
!153 = !DILocation(line: 118, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !146, file: !14, line: 118, column: 9)
!155 = !DILocation(line: 118, column: 14, scope: !154)
!156 = !DILocation(line: 118, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !14, line: 118, column: 9)
!158 = !DILocation(line: 118, column: 23, scope: !157)
!159 = !DILocation(line: 118, column: 9, scope: !154)
!160 = !DILocation(line: 120, column: 30, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !14, line: 119, column: 9)
!162 = !DILocation(line: 120, column: 23, scope: !161)
!163 = !DILocation(line: 120, column: 13, scope: !161)
!164 = !DILocation(line: 120, column: 18, scope: !161)
!165 = !DILocation(line: 120, column: 21, scope: !161)
!166 = !DILocation(line: 121, column: 9, scope: !161)
!167 = !DILocation(line: 118, column: 31, scope: !157)
!168 = !DILocation(line: 118, column: 9, scope: !157)
!169 = distinct !{!169, !159, !170, !61}
!170 = !DILocation(line: 121, column: 9, scope: !154)
!171 = !DILocation(line: 123, column: 9, scope: !146)
!172 = !DILocation(line: 123, column: 21, scope: !146)
!173 = !DILocation(line: 124, column: 19, scope: !146)
!174 = !DILocation(line: 124, column: 9, scope: !146)
!175 = !DILocation(line: 126, column: 1, scope: !133)
