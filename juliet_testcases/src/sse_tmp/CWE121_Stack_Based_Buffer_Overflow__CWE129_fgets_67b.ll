; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType = type { i32 }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b_badSink(i32 %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !22
  %0 = load i32, i32* %structFirst, align 4, !dbg !22
  store i32 %0, i32* %data, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !26, metadata !DIExpression()), !dbg !30
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !30
  %2 = load i32, i32* %data, align 4, !dbg !31
  %cmp = icmp sge i32 %2, 0, !dbg !33
  br i1 %cmp, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !35
  %idxprom = sext i32 %3 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  store i32 1, i32* %arrayidx, align 4, !dbg !38
  store i32 0, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !41

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !42
  %cmp1 = icmp slt i32 %4, 10, !dbg !44
  br i1 %cmp1, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !46
  %idxprom2 = sext i32 %5 to i64, !dbg !48
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !48
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !48
  call void @printIntLine(i32 %6), !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %7, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !56

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !57
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b_goodG2BSink(i32 %myStruct.coerce) #0 !dbg !60 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %data, metadata !63, metadata !DIExpression()), !dbg !64
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !65
  %0 = load i32, i32* %structFirst, align 4, !dbg !65
  store i32 %0, i32* %data, align 4, !dbg !64
  call void @llvm.dbg.declare(metadata i32* %i, metadata !66, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !69, metadata !DIExpression()), !dbg !70
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !70
  %2 = load i32, i32* %data, align 4, !dbg !71
  %cmp = icmp sge i32 %2, 0, !dbg !73
  br i1 %cmp, label %if.then, label %if.else, !dbg !74

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !75
  %idxprom = sext i32 %3 to i64, !dbg !77
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !77
  store i32 1, i32* %arrayidx, align 4, !dbg !78
  store i32 0, i32* %i, align 4, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !82
  %cmp1 = icmp slt i32 %4, 10, !dbg !84
  br i1 %cmp1, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !86
  %idxprom2 = sext i32 %5 to i64, !dbg !88
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !88
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !88
  call void @printIntLine(i32 %6), !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !91
  %inc = add nsw i32 %7, 1, !dbg !91
  store i32 %inc, i32* %i, align 4, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b_goodB2GSink(i32 %myStruct.coerce) #0 !dbg !99 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, align 4
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, i32 0, i32 0
  store i32 %myStruct.coerce, i32* %coerce.dive, align 4
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32* %data, metadata !102, metadata !DIExpression()), !dbg !103
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType* %myStruct, i32 0, i32 0, !dbg !104
  %0 = load i32, i32* %structFirst, align 4, !dbg !104
  store i32 %0, i32* %data, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32* %i, metadata !105, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !108, metadata !DIExpression()), !dbg !109
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !109
  %2 = load i32, i32* %data, align 4, !dbg !110
  %cmp = icmp sge i32 %2, 0, !dbg !112
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !113

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !114
  %cmp1 = icmp slt i32 %3, 10, !dbg !115
  br i1 %cmp1, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !117
  %idxprom = sext i32 %4 to i64, !dbg !119
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !119
  store i32 1, i32* %arrayidx, align 4, !dbg !120
  store i32 0, i32* %i, align 4, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !124
  %cmp2 = icmp slt i32 %5, 10, !dbg !126
  br i1 %cmp2, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !128
  %idxprom3 = sext i32 %6 to i64, !dbg !130
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !130
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !130
  call void @printIntLine(i32 %7), !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !133
  %inc = add nsw i32 %8, 1, !dbg !133
  store i32 %inc, i32* %i, align 4, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !137

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !138
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b_badSink", scope: !10, file: !10, line: 29, type: !11, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType", file: !10, line: 25, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67_structType", file: !10, line: 22, size: 32, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 24, baseType: !17, size: 32)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 29, type: !13)
!19 = !DILocation(line: 29, column: 130, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 31, type: !17)
!21 = !DILocation(line: 31, column: 9, scope: !9)
!22 = !DILocation(line: 31, column: 25, scope: !9)
!23 = !DILocalVariable(name: "i", scope: !24, file: !10, line: 33, type: !17)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 32, column: 5)
!25 = !DILocation(line: 33, column: 13, scope: !24)
!26 = !DILocalVariable(name: "buffer", scope: !24, file: !10, line: 34, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 34, column: 13, scope: !24)
!31 = !DILocation(line: 37, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !10, line: 37, column: 13)
!33 = !DILocation(line: 37, column: 18, scope: !32)
!34 = !DILocation(line: 37, column: 13, scope: !24)
!35 = !DILocation(line: 39, column: 20, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 38, column: 9)
!37 = !DILocation(line: 39, column: 13, scope: !36)
!38 = !DILocation(line: 39, column: 26, scope: !36)
!39 = !DILocation(line: 41, column: 19, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 41, column: 13)
!41 = !DILocation(line: 41, column: 17, scope: !40)
!42 = !DILocation(line: 41, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !10, line: 41, column: 13)
!44 = !DILocation(line: 41, column: 26, scope: !43)
!45 = !DILocation(line: 41, column: 13, scope: !40)
!46 = !DILocation(line: 43, column: 37, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !10, line: 42, column: 13)
!48 = !DILocation(line: 43, column: 30, scope: !47)
!49 = !DILocation(line: 43, column: 17, scope: !47)
!50 = !DILocation(line: 44, column: 13, scope: !47)
!51 = !DILocation(line: 41, column: 33, scope: !43)
!52 = !DILocation(line: 41, column: 13, scope: !43)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 44, column: 13, scope: !40)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 45, column: 9, scope: !36)
!57 = !DILocation(line: 48, column: 13, scope: !58)
!58 = distinct !DILexicalBlock(scope: !32, file: !10, line: 47, column: 9)
!59 = !DILocation(line: 51, column: 1, scope: !9)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b_goodG2BSink", scope: !10, file: !10, line: 58, type: !11, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocalVariable(name: "myStruct", arg: 1, scope: !60, file: !10, line: 58, type: !13)
!62 = !DILocation(line: 58, column: 134, scope: !60)
!63 = !DILocalVariable(name: "data", scope: !60, file: !10, line: 60, type: !17)
!64 = !DILocation(line: 60, column: 9, scope: !60)
!65 = !DILocation(line: 60, column: 25, scope: !60)
!66 = !DILocalVariable(name: "i", scope: !67, file: !10, line: 62, type: !17)
!67 = distinct !DILexicalBlock(scope: !60, file: !10, line: 61, column: 5)
!68 = !DILocation(line: 62, column: 13, scope: !67)
!69 = !DILocalVariable(name: "buffer", scope: !67, file: !10, line: 63, type: !27)
!70 = !DILocation(line: 63, column: 13, scope: !67)
!71 = !DILocation(line: 66, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !10, line: 66, column: 13)
!73 = !DILocation(line: 66, column: 18, scope: !72)
!74 = !DILocation(line: 66, column: 13, scope: !67)
!75 = !DILocation(line: 68, column: 20, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !10, line: 67, column: 9)
!77 = !DILocation(line: 68, column: 13, scope: !76)
!78 = !DILocation(line: 68, column: 26, scope: !76)
!79 = !DILocation(line: 70, column: 19, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !10, line: 70, column: 13)
!81 = !DILocation(line: 70, column: 17, scope: !80)
!82 = !DILocation(line: 70, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !10, line: 70, column: 13)
!84 = !DILocation(line: 70, column: 26, scope: !83)
!85 = !DILocation(line: 70, column: 13, scope: !80)
!86 = !DILocation(line: 72, column: 37, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !10, line: 71, column: 13)
!88 = !DILocation(line: 72, column: 30, scope: !87)
!89 = !DILocation(line: 72, column: 17, scope: !87)
!90 = !DILocation(line: 73, column: 13, scope: !87)
!91 = !DILocation(line: 70, column: 33, scope: !83)
!92 = !DILocation(line: 70, column: 13, scope: !83)
!93 = distinct !{!93, !85, !94, !55}
!94 = !DILocation(line: 73, column: 13, scope: !80)
!95 = !DILocation(line: 74, column: 9, scope: !76)
!96 = !DILocation(line: 77, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !72, file: !10, line: 76, column: 9)
!98 = !DILocation(line: 80, column: 1, scope: !60)
!99 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_fgets_67b_goodB2GSink", scope: !10, file: !10, line: 83, type: !11, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "myStruct", arg: 1, scope: !99, file: !10, line: 83, type: !13)
!101 = !DILocation(line: 83, column: 134, scope: !99)
!102 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 85, type: !17)
!103 = !DILocation(line: 85, column: 9, scope: !99)
!104 = !DILocation(line: 85, column: 25, scope: !99)
!105 = !DILocalVariable(name: "i", scope: !106, file: !10, line: 87, type: !17)
!106 = distinct !DILexicalBlock(scope: !99, file: !10, line: 86, column: 5)
!107 = !DILocation(line: 87, column: 13, scope: !106)
!108 = !DILocalVariable(name: "buffer", scope: !106, file: !10, line: 88, type: !27)
!109 = !DILocation(line: 88, column: 13, scope: !106)
!110 = !DILocation(line: 90, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !10, line: 90, column: 13)
!112 = !DILocation(line: 90, column: 18, scope: !111)
!113 = !DILocation(line: 90, column: 23, scope: !111)
!114 = !DILocation(line: 90, column: 26, scope: !111)
!115 = !DILocation(line: 90, column: 31, scope: !111)
!116 = !DILocation(line: 90, column: 13, scope: !106)
!117 = !DILocation(line: 92, column: 20, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !10, line: 91, column: 9)
!119 = !DILocation(line: 92, column: 13, scope: !118)
!120 = !DILocation(line: 92, column: 26, scope: !118)
!121 = !DILocation(line: 94, column: 19, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !10, line: 94, column: 13)
!123 = !DILocation(line: 94, column: 17, scope: !122)
!124 = !DILocation(line: 94, column: 24, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !10, line: 94, column: 13)
!126 = !DILocation(line: 94, column: 26, scope: !125)
!127 = !DILocation(line: 94, column: 13, scope: !122)
!128 = !DILocation(line: 96, column: 37, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !10, line: 95, column: 13)
!130 = !DILocation(line: 96, column: 30, scope: !129)
!131 = !DILocation(line: 96, column: 17, scope: !129)
!132 = !DILocation(line: 97, column: 13, scope: !129)
!133 = !DILocation(line: 94, column: 33, scope: !125)
!134 = !DILocation(line: 94, column: 13, scope: !125)
!135 = distinct !{!135, !127, !136, !55}
!136 = !DILocation(line: 97, column: 13, scope: !122)
!137 = !DILocation(line: 98, column: 9, scope: !118)
!138 = !DILocation(line: 101, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !111, file: !10, line: 100, column: 9)
!140 = !DILocation(line: 104, column: 1, scope: !99)
