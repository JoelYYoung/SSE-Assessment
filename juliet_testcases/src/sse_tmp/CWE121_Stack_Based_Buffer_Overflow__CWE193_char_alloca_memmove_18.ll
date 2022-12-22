; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 10, align 16, !dbg !21
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !20
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %1 = alloca i8, i64 11, align 16, !dbg !24
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !23
  br label %source, !dbg !25

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !26), !dbg !27
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !28
  store i8* %2, i8** %data, align 8, !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [11 x i8]* %source1 to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  %5 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !39
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !40
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !41
  %add = add i64 %call, 1, !dbg !42
  %mul = mul i64 %add, 1, !dbg !43
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !39
  %6 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %6), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #7, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #7, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 10, align 16, !dbg !74
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %1 = alloca i8, i64 11, align 16, !dbg !77
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !76
  br label %source, !dbg !78

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !79), !dbg !80
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !81
  store i8* %2, i8** %data, align 8, !dbg !82
  %3 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !85, metadata !DIExpression()), !dbg !87
  %4 = bitcast [11 x i8]* %source1 to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !87
  %5 = load i8*, i8** %data, align 8, !dbg !88
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !89
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !90
  %call = call i64 @strlen(i8* %arraydecay2) #6, !dbg !91
  %add = add i64 %call, 1, !dbg !92
  %mul = mul i64 %add, 1, !dbg !93
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !89
  %6 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* %6), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !4)
!18 = !DILocation(line: 30, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !4)
!20 = !DILocation(line: 31, column: 12, scope: !13)
!21 = !DILocation(line: 31, column: 36, scope: !13)
!22 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !4)
!23 = !DILocation(line: 32, column: 12, scope: !13)
!24 = !DILocation(line: 32, column: 37, scope: !13)
!25 = !DILocation(line: 33, column: 5, scope: !13)
!26 = !DILabel(scope: !13, name: "source", file: !14, line: 34)
!27 = !DILocation(line: 34, column: 1, scope: !13)
!28 = !DILocation(line: 37, column: 12, scope: !13)
!29 = !DILocation(line: 37, column: 10, scope: !13)
!30 = !DILocation(line: 38, column: 5, scope: !13)
!31 = !DILocation(line: 38, column: 13, scope: !13)
!32 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 40, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 39, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 40, column: 14, scope: !33)
!38 = !DILocation(line: 43, column: 17, scope: !33)
!39 = !DILocation(line: 43, column: 9, scope: !33)
!40 = !DILocation(line: 43, column: 39, scope: !33)
!41 = !DILocation(line: 43, column: 32, scope: !33)
!42 = !DILocation(line: 43, column: 47, scope: !33)
!43 = !DILocation(line: 43, column: 52, scope: !33)
!44 = !DILocation(line: 44, column: 19, scope: !33)
!45 = !DILocation(line: 44, column: 9, scope: !33)
!46 = !DILocation(line: 46, column: 1, scope: !13)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_18_good", scope: !14, file: !14, line: 73, type: !15, scopeLine: 74, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 75, column: 5, scope: !47)
!49 = !DILocation(line: 76, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 88, type: !51, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 88, type: !53)
!56 = !DILocation(line: 88, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 88, type: !54)
!58 = !DILocation(line: 88, column: 27, scope: !50)
!59 = !DILocation(line: 91, column: 22, scope: !50)
!60 = !DILocation(line: 91, column: 12, scope: !50)
!61 = !DILocation(line: 91, column: 5, scope: !50)
!62 = !DILocation(line: 93, column: 5, scope: !50)
!63 = !DILocation(line: 94, column: 5, scope: !50)
!64 = !DILocation(line: 95, column: 5, scope: !50)
!65 = !DILocation(line: 98, column: 5, scope: !50)
!66 = !DILocation(line: 99, column: 5, scope: !50)
!67 = !DILocation(line: 100, column: 5, scope: !50)
!68 = !DILocation(line: 102, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 55, type: !4)
!71 = !DILocation(line: 55, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !14, line: 56, type: !4)
!73 = !DILocation(line: 56, column: 12, scope: !69)
!74 = !DILocation(line: 56, column: 36, scope: !69)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !14, line: 57, type: !4)
!76 = !DILocation(line: 57, column: 12, scope: !69)
!77 = !DILocation(line: 57, column: 37, scope: !69)
!78 = !DILocation(line: 58, column: 5, scope: !69)
!79 = !DILabel(scope: !69, name: "source", file: !14, line: 59)
!80 = !DILocation(line: 59, column: 1, scope: !69)
!81 = !DILocation(line: 62, column: 12, scope: !69)
!82 = !DILocation(line: 62, column: 10, scope: !69)
!83 = !DILocation(line: 63, column: 5, scope: !69)
!84 = !DILocation(line: 63, column: 13, scope: !69)
!85 = !DILocalVariable(name: "source", scope: !86, file: !14, line: 65, type: !34)
!86 = distinct !DILexicalBlock(scope: !69, file: !14, line: 64, column: 5)
!87 = !DILocation(line: 65, column: 14, scope: !86)
!88 = !DILocation(line: 68, column: 17, scope: !86)
!89 = !DILocation(line: 68, column: 9, scope: !86)
!90 = !DILocation(line: 68, column: 39, scope: !86)
!91 = !DILocation(line: 68, column: 32, scope: !86)
!92 = !DILocation(line: 68, column: 47, scope: !86)
!93 = !DILocation(line: 68, column: 52, scope: !86)
!94 = !DILocation(line: 69, column: 19, scope: !86)
!95 = !DILocation(line: 69, column: 9, scope: !86)
!96 = !DILocation(line: 71, column: 1, scope: !69)
