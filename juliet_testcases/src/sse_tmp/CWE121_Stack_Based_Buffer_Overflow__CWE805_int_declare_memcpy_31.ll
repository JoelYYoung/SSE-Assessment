; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i32*, i32** %data, align 8, !dbg !34
  store i32* %0, i32** %dataCopy, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !36
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !37
  store i32* %1, i32** %data1, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !40
  %3 = load i32*, i32** %data1, align 8, !dbg !41
  %4 = bitcast i32* %3 to i8*, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %5 = bitcast i32* %arraydecay2 to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !42
  %6 = load i32*, i32** %data1, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !43
  %7 = load i32, i32* %arrayidx, align 4, !dbg !43
  call void @printIntLine(i32 %7), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printIntLine(i32) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #6, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #6, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !76
  store i32* %arraydecay, i32** %data, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !78, metadata !DIExpression()), !dbg !80
  %0 = load i32*, i32** %data, align 8, !dbg !81
  store i32* %0, i32** %dataCopy, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !82, metadata !DIExpression()), !dbg !83
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !84
  store i32* %1, i32** %data1, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !87
  %3 = load i32*, i32** %data1, align 8, !dbg !88
  %4 = bitcast i32* %3 to i8*, !dbg !89
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !89
  %5 = bitcast i32* %arraydecay2 to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %4, i8* align 16 %5, i64 400, i1 false), !dbg !89
  %6 = load i32*, i32** %data1, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !90
  %7 = load i32, i32* %arrayidx, align 4, !dbg !90
  call void @printIntLine(i32 %7), !dbg !91
  ret void, !dbg !92
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 28, column: 12, scope: !11)
!30 = !DILocation(line: 28, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dataCopy", scope: !32, file: !12, line: 30, type: !16)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!33 = !DILocation(line: 30, column: 15, scope: !32)
!34 = !DILocation(line: 30, column: 26, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !12, line: 31, type: !16)
!36 = !DILocation(line: 31, column: 15, scope: !32)
!37 = !DILocation(line: 31, column: 22, scope: !32)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 33, type: !25)
!39 = distinct !DILexicalBlock(scope: !32, file: !12, line: 32, column: 9)
!40 = !DILocation(line: 33, column: 17, scope: !39)
!41 = !DILocation(line: 35, column: 20, scope: !39)
!42 = !DILocation(line: 35, column: 13, scope: !39)
!43 = !DILocation(line: 36, column: 26, scope: !39)
!44 = !DILocation(line: 36, column: 13, scope: !39)
!45 = !DILocation(line: 39, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_31_good", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 67, column: 5, scope: !46)
!48 = !DILocation(line: 68, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 79, type: !50, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!17, !17, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 79, type: !17)
!56 = !DILocation(line: 79, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 79, type: !52)
!58 = !DILocation(line: 79, column: 27, scope: !49)
!59 = !DILocation(line: 82, column: 22, scope: !49)
!60 = !DILocation(line: 82, column: 12, scope: !49)
!61 = !DILocation(line: 82, column: 5, scope: !49)
!62 = !DILocation(line: 84, column: 5, scope: !49)
!63 = !DILocation(line: 85, column: 5, scope: !49)
!64 = !DILocation(line: 86, column: 5, scope: !49)
!65 = !DILocation(line: 89, column: 5, scope: !49)
!66 = !DILocation(line: 90, column: 5, scope: !49)
!67 = !DILocation(line: 91, column: 5, scope: !49)
!68 = !DILocation(line: 93, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 48, type: !16)
!71 = !DILocation(line: 48, column: 11, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !12, line: 49, type: !20)
!73 = !DILocation(line: 49, column: 9, scope: !69)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !12, line: 50, type: !25)
!75 = !DILocation(line: 50, column: 9, scope: !69)
!76 = !DILocation(line: 52, column: 12, scope: !69)
!77 = !DILocation(line: 52, column: 10, scope: !69)
!78 = !DILocalVariable(name: "dataCopy", scope: !79, file: !12, line: 54, type: !16)
!79 = distinct !DILexicalBlock(scope: !69, file: !12, line: 53, column: 5)
!80 = !DILocation(line: 54, column: 15, scope: !79)
!81 = !DILocation(line: 54, column: 26, scope: !79)
!82 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 55, type: !16)
!83 = !DILocation(line: 55, column: 15, scope: !79)
!84 = !DILocation(line: 55, column: 22, scope: !79)
!85 = !DILocalVariable(name: "source", scope: !86, file: !12, line: 57, type: !25)
!86 = distinct !DILexicalBlock(scope: !79, file: !12, line: 56, column: 9)
!87 = !DILocation(line: 57, column: 17, scope: !86)
!88 = !DILocation(line: 59, column: 20, scope: !86)
!89 = !DILocation(line: 59, column: 13, scope: !86)
!90 = !DILocation(line: 60, column: 26, scope: !86)
!91 = !DILocation(line: 60, column: 13, scope: !86)
!92 = !DILocation(line: 63, column: 1, scope: !69)
