; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 50, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 100, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  br label %while.end, !dbg !31

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx1, align 1, !dbg !40
  %4 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !44
  store i8 0, i8* %arrayidx3, align 1, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = alloca i8, i64 50, align 16, !dbg !76
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %1 = alloca i8, i64 100, align 16, !dbg !79
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !78
  br label %while.body, !dbg !80

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !81
  store i8* %2, i8** %data, align 8, !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  br label %while.end, !dbg !86

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !90
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !91
  store i8 0, i8* %arrayidx1, align 1, !dbg !92
  %4 = load i8*, i8** %data, align 8, !dbg !93
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  %call = call i8* @strncpy(i8* %4, i8* %arraydecay2, i64 99) #5, !dbg !95
  %5 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !96
  store i8 0, i8* %arrayidx3, align 1, !dbg !97
  %6 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %6), !dbg !99
  ret void, !dbg !100
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 37, scope: !13)
!25 = !DILocation(line: 28, column: 5, scope: !13)
!26 = !DILocation(line: 32, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!28 = !DILocation(line: 32, column: 14, scope: !27)
!29 = !DILocation(line: 33, column: 9, scope: !27)
!30 = !DILocation(line: 33, column: 17, scope: !27)
!31 = !DILocation(line: 34, column: 9, scope: !27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 37, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 37, column: 14, scope: !33)
!38 = !DILocation(line: 38, column: 9, scope: !33)
!39 = !DILocation(line: 39, column: 9, scope: !33)
!40 = !DILocation(line: 39, column: 23, scope: !33)
!41 = !DILocation(line: 41, column: 17, scope: !33)
!42 = !DILocation(line: 41, column: 23, scope: !33)
!43 = !DILocation(line: 41, column: 9, scope: !33)
!44 = !DILocation(line: 42, column: 9, scope: !33)
!45 = !DILocation(line: 42, column: 21, scope: !33)
!46 = !DILocation(line: 43, column: 19, scope: !33)
!47 = !DILocation(line: 43, column: 9, scope: !33)
!48 = !DILocation(line: 45, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_16_good", scope: !14, file: !14, line: 75, type: !15, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 77, column: 5, scope: !49)
!51 = !DILocation(line: 78, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 90, type: !53, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !14, line: 90, type: !55)
!58 = !DILocation(line: 90, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !14, line: 90, type: !56)
!60 = !DILocation(line: 90, column: 27, scope: !52)
!61 = !DILocation(line: 93, column: 22, scope: !52)
!62 = !DILocation(line: 93, column: 12, scope: !52)
!63 = !DILocation(line: 93, column: 5, scope: !52)
!64 = !DILocation(line: 95, column: 5, scope: !52)
!65 = !DILocation(line: 96, column: 5, scope: !52)
!66 = !DILocation(line: 97, column: 5, scope: !52)
!67 = !DILocation(line: 100, column: 5, scope: !52)
!68 = !DILocation(line: 101, column: 5, scope: !52)
!69 = !DILocation(line: 102, column: 5, scope: !52)
!70 = !DILocation(line: 104, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !14, line: 54, type: !4)
!73 = !DILocation(line: 54, column: 12, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !14, line: 55, type: !4)
!75 = !DILocation(line: 55, column: 12, scope: !71)
!76 = !DILocation(line: 55, column: 36, scope: !71)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !14, line: 56, type: !4)
!78 = !DILocation(line: 56, column: 12, scope: !71)
!79 = !DILocation(line: 56, column: 37, scope: !71)
!80 = !DILocation(line: 57, column: 5, scope: !71)
!81 = !DILocation(line: 60, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !71, file: !14, line: 58, column: 5)
!83 = !DILocation(line: 60, column: 14, scope: !82)
!84 = !DILocation(line: 61, column: 9, scope: !82)
!85 = !DILocation(line: 61, column: 17, scope: !82)
!86 = !DILocation(line: 62, column: 9, scope: !82)
!87 = !DILocalVariable(name: "source", scope: !88, file: !14, line: 65, type: !34)
!88 = distinct !DILexicalBlock(scope: !71, file: !14, line: 64, column: 5)
!89 = !DILocation(line: 65, column: 14, scope: !88)
!90 = !DILocation(line: 66, column: 9, scope: !88)
!91 = !DILocation(line: 67, column: 9, scope: !88)
!92 = !DILocation(line: 67, column: 23, scope: !88)
!93 = !DILocation(line: 69, column: 17, scope: !88)
!94 = !DILocation(line: 69, column: 23, scope: !88)
!95 = !DILocation(line: 69, column: 9, scope: !88)
!96 = !DILocation(line: 70, column: 9, scope: !88)
!97 = !DILocation(line: 70, column: 21, scope: !88)
!98 = !DILocation(line: 71, column: 19, scope: !88)
!99 = !DILocation(line: 71, column: 9, scope: !88)
!100 = !DILocation(line: 73, column: 1, scope: !71)
