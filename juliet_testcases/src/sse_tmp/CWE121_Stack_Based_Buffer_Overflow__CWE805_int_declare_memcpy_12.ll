; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay1, i32** %data, align 8, !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !41
  %1 = load i32*, i32** %data, align 8, !dbg !42
  %2 = bitcast i32* %1 to i8*, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !44
  %5 = load i32, i32* %arrayidx, align 4, !dbg !44
  call void @printIntLine(i32 %5), !dbg !45
  ret void, !dbg !46
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12_good() #0 !dbg !47 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #6, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #6, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !77
  %tobool = icmp ne i32 %call, 0, !dbg !77
  br i1 %tobool, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !80
  store i32* %arraydecay, i32** %data, align 8, !dbg !82
  br label %if.end, !dbg !83

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay1, i32** %data, align 8, !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %2 = bitcast i32* %1 to i8*, !dbg !91
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !91
  %3 = bitcast i32* %arraydecay2 to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 16 %3, i64 400, i1 false), !dbg !91
  %4 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !92
  %5 = load i32, i32* %arrayidx, align 4, !dbg !92
  call void @printIntLine(i32 %5), !dbg !93
  ret void, !dbg !94
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12.c", directory: "/root/SSE-Assessment")
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
!29 = !DILocation(line: 26, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!31 = !DILocation(line: 26, column: 8, scope: !11)
!32 = !DILocation(line: 30, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 27, column: 5)
!34 = !DILocation(line: 30, column: 14, scope: !33)
!35 = !DILocation(line: 31, column: 5, scope: !33)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !30, file: !12, line: 33, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 38, type: !25)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!41 = !DILocation(line: 38, column: 13, scope: !40)
!42 = !DILocation(line: 40, column: 16, scope: !40)
!43 = !DILocation(line: 40, column: 9, scope: !40)
!44 = !DILocation(line: 41, column: 22, scope: !40)
!45 = !DILocation(line: 41, column: 9, scope: !40)
!46 = !DILocation(line: 43, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_12_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 76, column: 5, scope: !47)
!49 = !DILocation(line: 77, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !51, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DISubroutineType(types: !52)
!52 = !{!17, !17, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 89, type: !17)
!57 = !DILocation(line: 89, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 89, type: !53)
!59 = !DILocation(line: 89, column: 27, scope: !50)
!60 = !DILocation(line: 92, column: 22, scope: !50)
!61 = !DILocation(line: 92, column: 12, scope: !50)
!62 = !DILocation(line: 92, column: 5, scope: !50)
!63 = !DILocation(line: 94, column: 5, scope: !50)
!64 = !DILocation(line: 95, column: 5, scope: !50)
!65 = !DILocation(line: 96, column: 5, scope: !50)
!66 = !DILocation(line: 99, column: 5, scope: !50)
!67 = !DILocation(line: 100, column: 5, scope: !50)
!68 = !DILocation(line: 101, column: 5, scope: !50)
!69 = !DILocation(line: 103, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 53, type: !16)
!72 = !DILocation(line: 53, column: 11, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 54, type: !20)
!74 = !DILocation(line: 54, column: 9, scope: !70)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 55, type: !25)
!76 = !DILocation(line: 55, column: 9, scope: !70)
!77 = !DILocation(line: 56, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !12, line: 56, column: 8)
!79 = !DILocation(line: 56, column: 8, scope: !70)
!80 = !DILocation(line: 59, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !12, line: 57, column: 5)
!82 = !DILocation(line: 59, column: 14, scope: !81)
!83 = !DILocation(line: 60, column: 5, scope: !81)
!84 = !DILocation(line: 64, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !12, line: 62, column: 5)
!86 = !DILocation(line: 64, column: 14, scope: !85)
!87 = !DILocalVariable(name: "source", scope: !88, file: !12, line: 67, type: !25)
!88 = distinct !DILexicalBlock(scope: !70, file: !12, line: 66, column: 5)
!89 = !DILocation(line: 67, column: 13, scope: !88)
!90 = !DILocation(line: 69, column: 16, scope: !88)
!91 = !DILocation(line: 69, column: 9, scope: !88)
!92 = !DILocation(line: 70, column: 22, scope: !88)
!93 = !DILocation(line: 70, column: 9, scope: !88)
!94 = !DILocation(line: 72, column: 1, scope: !70)
