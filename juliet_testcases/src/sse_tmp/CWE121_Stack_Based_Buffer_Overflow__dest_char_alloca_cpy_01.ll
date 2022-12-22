; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01_bad() #0 !dbg !13 {
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
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !25
  store i8* %2, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !29, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !35
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx1, align 1, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  %call = call i8* @strcpy(i8* %4, i8* %arraydecay2) #5, !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* %5), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* null) #5, !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 %conv) #5, !dbg !58
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01_good(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01_bad(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !66 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = alloca i8, i64 50, align 16, !dbg !71
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %1 = alloca i8, i64 100, align 16, !dbg !74
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !73
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !75
  store i8* %2, i8** %data, align 8, !dbg !76
  %3 = load i8*, i8** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !79, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !82
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !83
  store i8 0, i8* %arrayidx1, align 1, !dbg !84
  %4 = load i8*, i8** %data, align 8, !dbg !85
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !86
  %call = call i8* @strcpy(i8* %4, i8* %arraydecay2) #5, !dbg !87
  %5 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %5), !dbg !89
  ret void, !dbg !90
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01.c", directory: "/root/SSE-Assessment")
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
!25 = !DILocation(line: 30, column: 12, scope: !13)
!26 = !DILocation(line: 30, column: 10, scope: !13)
!27 = !DILocation(line: 31, column: 5, scope: !13)
!28 = !DILocation(line: 31, column: 13, scope: !13)
!29 = !DILocalVariable(name: "source", scope: !30, file: !14, line: 33, type: !31)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 33, column: 14, scope: !30)
!35 = !DILocation(line: 34, column: 9, scope: !30)
!36 = !DILocation(line: 35, column: 9, scope: !30)
!37 = !DILocation(line: 35, column: 23, scope: !30)
!38 = !DILocation(line: 37, column: 16, scope: !30)
!39 = !DILocation(line: 37, column: 22, scope: !30)
!40 = !DILocation(line: 37, column: 9, scope: !30)
!41 = !DILocation(line: 38, column: 19, scope: !30)
!42 = !DILocation(line: 38, column: 9, scope: !30)
!43 = !DILocation(line: 40, column: 1, scope: !13)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_01_good", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 67, column: 5, scope: !44)
!46 = !DILocation(line: 68, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 80, type: !48, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !14, line: 80, type: !50)
!53 = !DILocation(line: 80, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !14, line: 80, type: !51)
!55 = !DILocation(line: 80, column: 27, scope: !47)
!56 = !DILocation(line: 83, column: 22, scope: !47)
!57 = !DILocation(line: 83, column: 12, scope: !47)
!58 = !DILocation(line: 83, column: 5, scope: !47)
!59 = !DILocation(line: 85, column: 5, scope: !47)
!60 = !DILocation(line: 86, column: 5, scope: !47)
!61 = !DILocation(line: 87, column: 5, scope: !47)
!62 = !DILocation(line: 90, column: 5, scope: !47)
!63 = !DILocation(line: 91, column: 5, scope: !47)
!64 = !DILocation(line: 92, column: 5, scope: !47)
!65 = !DILocation(line: 94, column: 5, scope: !47)
!66 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 47, type: !15, scopeLine: 48, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 49, type: !4)
!68 = !DILocation(line: 49, column: 12, scope: !66)
!69 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !14, line: 50, type: !4)
!70 = !DILocation(line: 50, column: 12, scope: !66)
!71 = !DILocation(line: 50, column: 36, scope: !66)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !14, line: 51, type: !4)
!73 = !DILocation(line: 51, column: 12, scope: !66)
!74 = !DILocation(line: 51, column: 37, scope: !66)
!75 = !DILocation(line: 53, column: 12, scope: !66)
!76 = !DILocation(line: 53, column: 10, scope: !66)
!77 = !DILocation(line: 54, column: 5, scope: !66)
!78 = !DILocation(line: 54, column: 13, scope: !66)
!79 = !DILocalVariable(name: "source", scope: !80, file: !14, line: 56, type: !31)
!80 = distinct !DILexicalBlock(scope: !66, file: !14, line: 55, column: 5)
!81 = !DILocation(line: 56, column: 14, scope: !80)
!82 = !DILocation(line: 57, column: 9, scope: !80)
!83 = !DILocation(line: 58, column: 9, scope: !80)
!84 = !DILocation(line: 58, column: 23, scope: !80)
!85 = !DILocation(line: 60, column: 16, scope: !80)
!86 = !DILocation(line: 60, column: 22, scope: !80)
!87 = !DILocation(line: 60, column: 9, scope: !80)
!88 = !DILocation(line: 61, column: 19, scope: !80)
!89 = !DILocation(line: 61, column: 9, scope: !80)
!90 = !DILocation(line: 63, column: 1, scope: !66)
