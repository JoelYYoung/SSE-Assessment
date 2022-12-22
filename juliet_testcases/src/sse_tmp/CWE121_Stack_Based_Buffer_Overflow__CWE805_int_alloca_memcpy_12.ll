; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 200, align 16, !dbg !21
  %1 = bitcast i8* %0 to i32*, !dbg !22
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = alloca i8, i64 400, align 16, !dbg !25
  %3 = bitcast i8* %2 to i32*, !dbg !26
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !29

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  store i32* %4, i32** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !34
  store i32* %5, i32** %data, align 8, !dbg !36
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  %8 = bitcast i32* %7 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %9 = bitcast i32* %arraydecay to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !44
  %10 = load i32*, i32** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 0, !dbg !45
  %11 = load i32, i32* %arrayidx, align 4, !dbg !45
  call void @printIntLine(i32 %11), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printIntLine(i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #6, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #6, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 200, align 16, !dbg !76
  %1 = bitcast i8* %0 to i32*, !dbg !77
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %2 = alloca i8, i64 400, align 16, !dbg !80
  %3 = bitcast i8* %2 to i32*, !dbg !81
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !79
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !85
  store i32* %4, i32** %data, align 8, !dbg !87
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !89
  store i32* %5, i32** %data, align 8, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !94
  %7 = load i32*, i32** %data, align 8, !dbg !95
  %8 = bitcast i32* %7 to i8*, !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !96
  %9 = bitcast i32* %arraydecay to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 400, i1 false), !dbg !96
  %10 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %10, i64 0, !dbg !97
  %11 = load i32, i32* %arrayidx, align 4, !dbg !97
  call void @printIntLine(i32 %11), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 11, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !4)
!20 = !DILocation(line: 24, column: 11, scope: !13)
!21 = !DILocation(line: 24, column: 34, scope: !13)
!22 = !DILocation(line: 24, column: 27, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !4)
!24 = !DILocation(line: 25, column: 11, scope: !13)
!25 = !DILocation(line: 25, column: 35, scope: !13)
!26 = !DILocation(line: 25, column: 28, scope: !13)
!27 = !DILocation(line: 26, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!29 = !DILocation(line: 26, column: 8, scope: !13)
!30 = !DILocation(line: 30, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !14, line: 27, column: 5)
!32 = !DILocation(line: 30, column: 14, scope: !31)
!33 = !DILocation(line: 31, column: 5, scope: !31)
!34 = !DILocation(line: 35, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !14, line: 33, column: 5)
!36 = !DILocation(line: 35, column: 14, scope: !35)
!37 = !DILocalVariable(name: "source", scope: !38, file: !14, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 38, column: 13, scope: !38)
!43 = !DILocation(line: 40, column: 16, scope: !38)
!44 = !DILocation(line: 40, column: 9, scope: !38)
!45 = !DILocation(line: 41, column: 22, scope: !38)
!46 = !DILocation(line: 41, column: 9, scope: !38)
!47 = !DILocation(line: 43, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_12_good", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DILocation(line: 76, column: 5, scope: !48)
!50 = !DILocation(line: 77, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 89, type: !52, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!5, !5, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 89, type: !5)
!58 = !DILocation(line: 89, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 89, type: !54)
!60 = !DILocation(line: 89, column: 27, scope: !51)
!61 = !DILocation(line: 92, column: 22, scope: !51)
!62 = !DILocation(line: 92, column: 12, scope: !51)
!63 = !DILocation(line: 92, column: 5, scope: !51)
!64 = !DILocation(line: 94, column: 5, scope: !51)
!65 = !DILocation(line: 95, column: 5, scope: !51)
!66 = !DILocation(line: 96, column: 5, scope: !51)
!67 = !DILocation(line: 99, column: 5, scope: !51)
!68 = !DILocation(line: 100, column: 5, scope: !51)
!69 = !DILocation(line: 101, column: 5, scope: !51)
!70 = !DILocation(line: 103, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 53, type: !4)
!73 = !DILocation(line: 53, column: 11, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !14, line: 54, type: !4)
!75 = !DILocation(line: 54, column: 11, scope: !71)
!76 = !DILocation(line: 54, column: 34, scope: !71)
!77 = !DILocation(line: 54, column: 27, scope: !71)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !14, line: 55, type: !4)
!79 = !DILocation(line: 55, column: 11, scope: !71)
!80 = !DILocation(line: 55, column: 35, scope: !71)
!81 = !DILocation(line: 55, column: 28, scope: !71)
!82 = !DILocation(line: 56, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !71, file: !14, line: 56, column: 8)
!84 = !DILocation(line: 56, column: 8, scope: !71)
!85 = !DILocation(line: 59, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !14, line: 57, column: 5)
!87 = !DILocation(line: 59, column: 14, scope: !86)
!88 = !DILocation(line: 60, column: 5, scope: !86)
!89 = !DILocation(line: 64, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !14, line: 62, column: 5)
!91 = !DILocation(line: 64, column: 14, scope: !90)
!92 = !DILocalVariable(name: "source", scope: !93, file: !14, line: 67, type: !39)
!93 = distinct !DILexicalBlock(scope: !71, file: !14, line: 66, column: 5)
!94 = !DILocation(line: 67, column: 13, scope: !93)
!95 = !DILocation(line: 69, column: 16, scope: !93)
!96 = !DILocation(line: 69, column: 9, scope: !93)
!97 = !DILocation(line: 70, column: 22, scope: !93)
!98 = !DILocation(line: 70, column: 9, scope: !93)
!99 = !DILocation(line: 72, column: 1, scope: !71)
