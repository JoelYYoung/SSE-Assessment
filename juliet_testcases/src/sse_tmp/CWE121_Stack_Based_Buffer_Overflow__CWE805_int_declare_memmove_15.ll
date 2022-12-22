; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %2 = bitcast i32* %1 to i8*, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !35
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !35
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !35
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !36
  %5 = load i32, i32* %arrayidx, align 4, !dbg !36
  call void @printIntLine(i32 %5), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15_good() #0 !dbg !39 {
entry:
  call void @goodG2B1(), !dbg !40
  call void @goodG2B2(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #6, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #6, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !70
  store i32* %arraydecay, i32** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !72, metadata !DIExpression()), !dbg !74
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !74
  %1 = load i32*, i32** %data, align 8, !dbg !75
  %2 = bitcast i32* %1 to i8*, !dbg !76
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !76
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !76
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !76
  %4 = load i32*, i32** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !77
  %5 = load i32, i32* %arrayidx, align 4, !dbg !77
  call void @printIntLine(i32 %5), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i32* %arraydecay, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %2 = bitcast i32* %1 to i8*, !dbg !93
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !93
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !93
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !94
  %5 = load i32, i32* %arrayidx, align 4, !dbg !94
  call void @printIntLine(i32 %5), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 24, column: 9, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 9, scope: !11)
!29 = !DILocation(line: 31, column: 16, scope: !11)
!30 = !DILocation(line: 31, column: 14, scope: !11)
!31 = !DILocalVariable(name: "source", scope: !32, file: !12, line: 39, type: !25)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!33 = !DILocation(line: 39, column: 13, scope: !32)
!34 = !DILocation(line: 41, column: 17, scope: !32)
!35 = !DILocation(line: 41, column: 9, scope: !32)
!36 = !DILocation(line: 42, column: 22, scope: !32)
!37 = !DILocation(line: 42, column: 9, scope: !32)
!38 = !DILocation(line: 44, column: 1, scope: !11)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_15_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 102, column: 5, scope: !39)
!41 = !DILocation(line: 103, column: 5, scope: !39)
!42 = !DILocation(line: 104, column: 1, scope: !39)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !44, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!17, !17, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 116, type: !17)
!50 = !DILocation(line: 116, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 116, type: !46)
!52 = !DILocation(line: 116, column: 27, scope: !43)
!53 = !DILocation(line: 119, column: 22, scope: !43)
!54 = !DILocation(line: 119, column: 12, scope: !43)
!55 = !DILocation(line: 119, column: 5, scope: !43)
!56 = !DILocation(line: 121, column: 5, scope: !43)
!57 = !DILocation(line: 122, column: 5, scope: !43)
!58 = !DILocation(line: 123, column: 5, scope: !43)
!59 = !DILocation(line: 126, column: 5, scope: !43)
!60 = !DILocation(line: 127, column: 5, scope: !43)
!61 = !DILocation(line: 128, column: 5, scope: !43)
!62 = !DILocation(line: 130, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 53, type: !16)
!65 = !DILocation(line: 53, column: 11, scope: !63)
!66 = !DILocalVariable(name: "dataBadBuffer", scope: !63, file: !12, line: 54, type: !20)
!67 = !DILocation(line: 54, column: 9, scope: !63)
!68 = !DILocalVariable(name: "dataGoodBuffer", scope: !63, file: !12, line: 55, type: !25)
!69 = !DILocation(line: 55, column: 9, scope: !63)
!70 = !DILocation(line: 64, column: 16, scope: !63)
!71 = !DILocation(line: 64, column: 14, scope: !63)
!72 = !DILocalVariable(name: "source", scope: !73, file: !12, line: 68, type: !25)
!73 = distinct !DILexicalBlock(scope: !63, file: !12, line: 67, column: 5)
!74 = !DILocation(line: 68, column: 13, scope: !73)
!75 = !DILocation(line: 70, column: 17, scope: !73)
!76 = !DILocation(line: 70, column: 9, scope: !73)
!77 = !DILocation(line: 71, column: 22, scope: !73)
!78 = !DILocation(line: 71, column: 9, scope: !73)
!79 = !DILocation(line: 73, column: 1, scope: !63)
!80 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 78, type: !16)
!82 = !DILocation(line: 78, column: 11, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 79, type: !20)
!84 = !DILocation(line: 79, column: 9, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 80, type: !25)
!86 = !DILocation(line: 80, column: 9, scope: !80)
!87 = !DILocation(line: 85, column: 16, scope: !80)
!88 = !DILocation(line: 85, column: 14, scope: !80)
!89 = !DILocalVariable(name: "source", scope: !90, file: !12, line: 93, type: !25)
!90 = distinct !DILexicalBlock(scope: !80, file: !12, line: 92, column: 5)
!91 = !DILocation(line: 93, column: 13, scope: !90)
!92 = !DILocation(line: 95, column: 17, scope: !90)
!93 = !DILocation(line: 95, column: 9, scope: !90)
!94 = !DILocation(line: 96, column: 22, scope: !90)
!95 = !DILocation(line: 96, column: 9, scope: !90)
!96 = !DILocation(line: 98, column: 1, scope: !80)
