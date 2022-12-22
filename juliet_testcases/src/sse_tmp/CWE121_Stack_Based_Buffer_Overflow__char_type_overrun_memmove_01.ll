; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01_bad() #0 !dbg !14 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !18, metadata !DIExpression()), !dbg !29
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !30
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !31
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !32
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !32
  call void @printLine(i8* %0), !dbg !33
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !34
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !35
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !35
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !36
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !39
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !40
  call void @printLine(i8* %arraydecay4), !dbg !41
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !42
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !42
  call void @printLine(i8* %1), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printLine(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01_good() #0 !dbg !45 {
entry:
  call void @good1(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !67 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !68, metadata !DIExpression()), !dbg !70
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !71
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !72
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !73
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !73
  call void @printLine(i8* %0), !dbg !74
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !75
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !76
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !76
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !77
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !78
  store i8 0, i8* %arrayidx, align 1, !dbg !79
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !80
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !81
  call void @printLine(i8* %arraydecay4), !dbg !82
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !83
  %1 = load i8*, i8** %voidSecond5, align 8, !dbg !83
  call void @printLine(i8* %1), !dbg !84
  ret void, !dbg !85
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01_bad", scope: !15, file: !15, line: 34, type: !16, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "structCharVoid", scope: !19, file: !15, line: 37, type: !20)
!19 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !15, line: 30, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !15, line: 25, size: 256, elements: !22)
!22 = !{!23, !27, !28}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !21, file: !15, line: 27, baseType: !24, size: 128)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 16)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !21, file: !15, line: 28, baseType: !4, size: 64, offset: 128)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !21, file: !15, line: 29, baseType: !4, size: 64, offset: 192)
!29 = !DILocation(line: 37, column: 18, scope: !19)
!30 = !DILocation(line: 38, column: 24, scope: !19)
!31 = !DILocation(line: 38, column: 35, scope: !19)
!32 = !DILocation(line: 40, column: 42, scope: !19)
!33 = !DILocation(line: 40, column: 9, scope: !19)
!34 = !DILocation(line: 42, column: 32, scope: !19)
!35 = !DILocation(line: 42, column: 9, scope: !19)
!36 = !DILocation(line: 43, column: 24, scope: !19)
!37 = !DILocation(line: 43, column: 9, scope: !19)
!38 = !DILocation(line: 43, column: 85, scope: !19)
!39 = !DILocation(line: 44, column: 42, scope: !19)
!40 = !DILocation(line: 44, column: 27, scope: !19)
!41 = !DILocation(line: 44, column: 9, scope: !19)
!42 = !DILocation(line: 45, column: 42, scope: !19)
!43 = !DILocation(line: 45, column: 9, scope: !19)
!44 = !DILocation(line: 47, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__char_type_overrun_memmove_01_good", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 70, column: 5, scope: !45)
!47 = !DILocation(line: 71, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 82, type: !49, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !15, line: 82, type: !51)
!54 = !DILocation(line: 82, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !15, line: 82, type: !52)
!56 = !DILocation(line: 82, column: 27, scope: !48)
!57 = !DILocation(line: 85, column: 22, scope: !48)
!58 = !DILocation(line: 85, column: 12, scope: !48)
!59 = !DILocation(line: 85, column: 5, scope: !48)
!60 = !DILocation(line: 87, column: 5, scope: !48)
!61 = !DILocation(line: 88, column: 5, scope: !48)
!62 = !DILocation(line: 89, column: 5, scope: !48)
!63 = !DILocation(line: 92, column: 5, scope: !48)
!64 = !DILocation(line: 93, column: 5, scope: !48)
!65 = !DILocation(line: 94, column: 5, scope: !48)
!66 = !DILocation(line: 96, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "good1", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocalVariable(name: "structCharVoid", scope: !69, file: !15, line: 56, type: !20)
!69 = distinct !DILexicalBlock(scope: !67, file: !15, line: 55, column: 5)
!70 = !DILocation(line: 56, column: 18, scope: !69)
!71 = !DILocation(line: 57, column: 24, scope: !69)
!72 = !DILocation(line: 57, column: 35, scope: !69)
!73 = !DILocation(line: 59, column: 42, scope: !69)
!74 = !DILocation(line: 59, column: 9, scope: !69)
!75 = !DILocation(line: 61, column: 32, scope: !69)
!76 = !DILocation(line: 61, column: 9, scope: !69)
!77 = !DILocation(line: 62, column: 24, scope: !69)
!78 = !DILocation(line: 62, column: 9, scope: !69)
!79 = !DILocation(line: 62, column: 85, scope: !69)
!80 = !DILocation(line: 63, column: 42, scope: !69)
!81 = !DILocation(line: 63, column: 27, scope: !69)
!82 = !DILocation(line: 63, column: 9, scope: !69)
!83 = !DILocation(line: 64, column: 42, scope: !69)
!84 = !DILocation(line: 64, column: 9, scope: !69)
!85 = !DILocation(line: 66, column: 1, scope: !67)
