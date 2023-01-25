; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  store i32 0, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !25
  %cmp = icmp slt i32 %0, 1, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %1 = alloca i8, i64 10, align 16, !dbg !29
  %2 = bitcast i8* %1 to i32*, !dbg !31
  store i32* %2, i32** %data, align 8, !dbg !32
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !34
  %inc = add nsw i32 %3, 1, !dbg !34
  store i32 %inc, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %6 = bitcast i32* %5 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !46
  %7 = bitcast i32* %arraydecay to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !46
  %8 = load i32*, i32** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !47
  %9 = load i32, i32* %arrayidx, align 4, !dbg !47
  call void @printIntLine(i32 %9), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* null) #6, !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 %conv) #6, !dbg !65
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17_good(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17_bad(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32* null, i32** %data, align 8, !dbg !78
  store i32 0, i32* %h, align 4, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !82
  %cmp = icmp slt i32 %0, 1, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %1 = alloca i8, i64 40, align 16, !dbg !86
  %2 = bitcast i8* %1 to i32*, !dbg !88
  store i32* %2, i32** %data, align 8, !dbg !89
  br label %for.inc, !dbg !90

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %h, align 4, !dbg !91
  %inc = add nsw i32 %3, 1, !dbg !91
  store i32 %inc, i32* %h, align 4, !dbg !91
  br label %for.cond, !dbg !92, !llvm.loop !93

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !97
  %5 = load i32*, i32** %data, align 8, !dbg !98
  %6 = bitcast i32* %5 to i8*, !dbg !99
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !99
  %7 = bitcast i32* %arraydecay to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 40, i1 false), !dbg !99
  %8 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !100
  %9 = load i32, i32* %arrayidx, align 4, !dbg !100
  call void @printIntLine(i32 %9), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 23, type: !5)
!18 = !DILocation(line: 23, column: 9, scope: !13)
!19 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 25, column: 10, scope: !13)
!22 = !DILocation(line: 26, column: 11, scope: !23)
!23 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 5)
!24 = !DILocation(line: 26, column: 9, scope: !23)
!25 = !DILocation(line: 26, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !14, line: 26, column: 5)
!27 = !DILocation(line: 26, column: 18, scope: !26)
!28 = !DILocation(line: 26, column: 5, scope: !23)
!29 = !DILocation(line: 29, column: 23, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !14, line: 27, column: 5)
!31 = !DILocation(line: 29, column: 16, scope: !30)
!32 = !DILocation(line: 29, column: 14, scope: !30)
!33 = !DILocation(line: 30, column: 5, scope: !30)
!34 = !DILocation(line: 26, column: 24, scope: !26)
!35 = !DILocation(line: 26, column: 5, scope: !26)
!36 = distinct !{!36, !28, !37, !38}
!37 = !DILocation(line: 30, column: 5, scope: !23)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocalVariable(name: "source", scope: !40, file: !14, line: 32, type: !41)
!40 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 10)
!44 = !DILocation(line: 32, column: 13, scope: !40)
!45 = !DILocation(line: 34, column: 16, scope: !40)
!46 = !DILocation(line: 34, column: 9, scope: !40)
!47 = !DILocation(line: 35, column: 22, scope: !40)
!48 = !DILocation(line: 35, column: 9, scope: !40)
!49 = !DILocation(line: 37, column: 1, scope: !13)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE131_memcpy_17_good", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 64, column: 5, scope: !50)
!52 = !DILocation(line: 65, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 77, type: !54, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!5, !5, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 77, type: !5)
!60 = !DILocation(line: 77, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 77, type: !56)
!62 = !DILocation(line: 77, column: 27, scope: !53)
!63 = !DILocation(line: 80, column: 22, scope: !53)
!64 = !DILocation(line: 80, column: 12, scope: !53)
!65 = !DILocation(line: 80, column: 5, scope: !53)
!66 = !DILocation(line: 82, column: 5, scope: !53)
!67 = !DILocation(line: 83, column: 5, scope: !53)
!68 = !DILocation(line: 84, column: 5, scope: !53)
!69 = !DILocation(line: 87, column: 5, scope: !53)
!70 = !DILocation(line: 88, column: 5, scope: !53)
!71 = !DILocation(line: 89, column: 5, scope: !53)
!72 = !DILocation(line: 91, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 44, type: !15, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocalVariable(name: "h", scope: !73, file: !14, line: 46, type: !5)
!75 = !DILocation(line: 46, column: 9, scope: !73)
!76 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 47, type: !4)
!77 = !DILocation(line: 47, column: 11, scope: !73)
!78 = !DILocation(line: 48, column: 10, scope: !73)
!79 = !DILocation(line: 49, column: 11, scope: !80)
!80 = distinct !DILexicalBlock(scope: !73, file: !14, line: 49, column: 5)
!81 = !DILocation(line: 49, column: 9, scope: !80)
!82 = !DILocation(line: 49, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !14, line: 49, column: 5)
!84 = !DILocation(line: 49, column: 18, scope: !83)
!85 = !DILocation(line: 49, column: 5, scope: !80)
!86 = !DILocation(line: 52, column: 23, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !14, line: 50, column: 5)
!88 = !DILocation(line: 52, column: 16, scope: !87)
!89 = !DILocation(line: 52, column: 14, scope: !87)
!90 = !DILocation(line: 53, column: 5, scope: !87)
!91 = !DILocation(line: 49, column: 24, scope: !83)
!92 = !DILocation(line: 49, column: 5, scope: !83)
!93 = distinct !{!93, !85, !94, !38}
!94 = !DILocation(line: 53, column: 5, scope: !80)
!95 = !DILocalVariable(name: "source", scope: !96, file: !14, line: 55, type: !41)
!96 = distinct !DILexicalBlock(scope: !73, file: !14, line: 54, column: 5)
!97 = !DILocation(line: 55, column: 13, scope: !96)
!98 = !DILocation(line: 57, column: 16, scope: !96)
!99 = !DILocation(line: 57, column: 9, scope: !96)
!100 = !DILocation(line: 58, column: 22, scope: !96)
!101 = !DILocation(line: 58, column: 9, scope: !96)
!102 = !DILocation(line: 60, column: 1, scope: !73)
